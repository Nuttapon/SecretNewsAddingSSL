class HotnewsController < ApplicationController
  # GET /hotnews
  # GET /hotnews.json
  before_filter :signed_in_user, :except => [:index,:create,:edit]
  load_and_authorize_resource :only => [:edit,:destroy,:new]
  

  def index
    @hotnews = Hotnews.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotnews }
    end
  end

  def hotnews_feed
    if params[:remember_token] == User.find_by_id(params[:id]).remember_token
         @hotnews = Hotnews.find(:all, :limit => 3, :order => 'created_at DESC')
          respond_to do |format|
          format.html
          format.json { render json: @hotnews.as_json(:methods => :filepdf, :only => [:id, :title, :created_at])}
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
  end

  # POST /hotnews
  # POST /hotnews.json
  def create
    @hotnews = Hotnews.new(params[:hotnews])
    @hotnews.user_id ||= params[:hotnews][:user_id] || current_user.id
    if checkadmin(@hotnews.user_id)
      respond_to do |format|
        if @hotnews.save
          format.html { redirect_to @hotnews, notice: 'Hotnews was successfully created.' }
          format.json { render json: @hotnews, status: :created, location: @hotnews }
        else
          format.html { render action: "new" }
          format.json { render json: @hotnews.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
          format.html { render action: "new" }
          format.json { render json: Hash["msg" => "Only Admin who can create this hotnews !!"] }
      end
    end
  end

  # PUT /hotnews/1
  # PUT /hotnews/1.json
  def update
    @hotnews = Hotnews.find(params[:id])

    respond_to do |format|
      if @hotnews.update_attributes(params[:hotnews])
        format.html { redirect_to @hotnews, notice: 'Hotnews was successfully updated.' }
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
      format.html { redirect_to hotnews_index_url }
      format.json { head :no_content }
    end
  end
end
