class NewsController < ApplicationController
  force_ssl :except => [:feed, :show]
  # GET /news
  # GET /news.json
  before_filter :signed_in_user, :except => [:feed, :show]
  before_filter :admin_user, only: [:edit,:destroy]
  
  def index
    @news = News.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  def feed
    if params[:remember_token] == User.find_by_id(params[:id]).remember_token
      @news = News.find(:all, :order => "updated_at DESC")
      respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @news.as_json(:only => [:title,:detail,:province],:methods => [:created_by,:file_thumbnail,:file_image, :file_pdf, :file_video,:datetime,:comment])}
        end
    else
      respond_to do |format|
          format.html
          format.json { render json: Hash["message" => "Permission denied"]}
        end
    end
    
    # url_files = []
    # @news.each do |n|
    #   if Attachfile.where(:news_id => n.id).first != [] && Attachfile.where(:news_id => n.id).first.file_content_type.split("/").first == "image"
    #     @files = Attachfile.where(:news_id => n.id).first
    #     u = ['http://192.168.5.118:3000'+@files.file.url(:feed)]
    #     url_files = url_files + u
    #   else
    #     u = ['null']
    #     url_files = url_files + u

    #   end
    # end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])
          # Create Read 
    if Read.where(:user_id => current_user.id , :news_id => @news.id) == []
      @read = Read.new
      @read.user_id = current_user.id
      @read.news_id = @news.id
      @read.save
    end

    @reads = Read.where(:news_id => @news.id)

    @unreads = User.find(:all, :conditions => ['id not in (?)', Read.where(:news_id => @news.id).map(&:user_id)])

    @files = Attachfile.where(:news_id => @news.id)

    url_files = []
    @files.each do |f|
      u = ['localhost'+f.file.url]
      url_files = url_files + u
    end
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: [@news,url_files] }

    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
    @news = News.new
    @news.user_id = current_user.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
    unless Comment.find_by_commentable_id(@news).nil?
    @value =  Comment.find_by_commentable_id(@news).comment
    end
    @edit_new = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  def create
    @news = current_user.news.new(params[:news])
    #@news.user_id = current_user.id
    respond_to do |format|
      if @news.save
        sent_notification(1)
        @news.comments.create(:title => params[:news][:title], :comment => params[:suggest],:user_id => current_user)
        format.html { redirect_to @news, notice: t("flash.save") }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        Comment.find_or_create_by_commentable_id(params[:id]).update_attributes(:title => params[:news][:title], :comment => params[:suggest], :user_id => current_user, :commentable_type => controller_name.classify)
        format.html { redirect_to @news, notice: t("flash.save") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url, notice: t("flash.delete") }
      format.json { head :no_content }
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def sent_notification(receiver_id)
    n = APN::GroupNotification.new
    n.group_id = receiver_id
    n.device_language = "TH"
    n.badge = 1
    n.alert = t("flash.msgnews")
    n.sound = "1.aiff"
    n.save!
    APN::App.find_by_id(1).send_group_notifications
  end

end
