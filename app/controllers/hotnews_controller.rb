class HotnewsController < ApplicationController
  force_ssl :except => [:hotnews_feed, :show]
  # GET /hotnews
  # GET /hotnews.json
  before_filter :signed_in_user, :except => [:hotnews_feed, :show]
  # load_and_authorize_resource :only => [:edit,:destroy,:new]
  before_filter :admin_user, only: [:edit,:destroy,:create]

  def index
    @hotnews = Hotnews.find(:all,:order => 'created_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotnews }
    end
  end

  def dashboard
    @recent_hotnews = Hotnews.find(:all, :limit => 5, :order => "created_at DESC")
    @recent_news = News.find(:all, :limit =>5 , :order => "created_at DESC")
  end

  def hotnews_feed
    if params[:remember_token] == User.find_by_id(params[:id]).remember_token
         @hotnews = Hotnews.find(:all, :limit => 3, :order => 'updated_at DESC')
          respond_to do |format|
          format.html
          format.json { render json: @hotnews.as_json(:only => [:id,:title],:methods => [:created_by,:file_thumbnail,:file_image, :file_pdf, :file_video ,:datetime,:comment]) }
        end
    else
       respond_to do |format|
          format.html
          format.json { render json: Hash["message" => "Permission denied"]}
        end
    end
   
  end
  # GET /hotnews/1
  # GET /hotnews/1.json
  def show
    @hotnews = Hotnews.find(params[:id])

          # Create Read 
    if HotnewsRead.where(:user_id => current_user.id , :hotnews_id => @hotnews.id) == []
      puts 'nil'
      @read = HotnewsRead.new
      @read.user_id = current_user.id
      @read.hotnews_id = @hotnews.id
      @read.save
    end

    @reads = HotnewsRead.where(:hotnews_id => @hotnews.id)

    @unreads = User.find(:all, :conditions => ['id not in (?)', HotnewsRead.where(:hotnews_id => @hotnews.id).map(&:user_id)])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotnews }
    end
  end

  # GET /hotnews/new
  # GET /hotnews/new.json
  def new
    @hotnews = Hotnews.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotnews }
    end
  end

  # GET /hotnews/1/edit
  def edit
    @hotnews = Hotnews.find(params[:id])
    unless Comment.find_by_commentable_id(@hotnews).nil?
    @value =  Comment.find_by_commentable_id(@hotnews).comment
    end
  end

  # POST /hotnews
  # POST /hotnews.json
  def create
    @hotnews = Hotnews.new(params[:hotnews])
    @hotnews.user_id ||= params[:hotnews][:user_id] || current_user.id
      respond_to do |format|
        if @hotnews.save
          sent_notification(1)
          @hotnews.comments.create(:title => params[:hotnews][:title], :comment => params[:suggest],:user_id => current_user)
          format.html { redirect_to @hotnews, notice: t("flash.save") }
          format.json { render json: @hotnews, status: :created, location: @hotnews }
        else
          format.html { render action: "new" }
          format.json { render json: @hotnews.errors, status: :unprocessable_entity }
        end
    end
  end

  # PUT /hotnews/1
  # PUT /hotnews/1.json
  def update
    @hotnews = Hotnews.find(params[:id])

    respond_to do |format|
      if @hotnews.update_attributes(params[:hotnews])
        Comment.find_or_create_by_commentable_id(params[:id]).update_attributes(:title => params[:hotnews][:title], :comment => params[:suggest], :user_id => current_user, :commentable_type => controller_name.classify)
        format.html { redirect_to @hotnews, notice: t("flash.save") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotnews.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotnews/1
  # DELETE /hotnews/1.json
  def destroy
    @hotnews = Hotnews.find(params[:id])
    @hotnews.destroy

    respond_to do |format|
      format.html { redirect_to hotnews_index_url, :notice => t("flash.delete") }
      format.json { head :no_content }
    end
  end

  private

  def sent_notification(receiver_id)
    n = APN::GroupNotification.new
    n.group_id = receiver_id
    n.device_language = "TH"
    n.badge = 1
    n.alert = t("flash.msghotnews")
    n.sound = "1.aiff"
    n.save!
    APN::App.find_by_id(1).send_group_notifications
  end


end
