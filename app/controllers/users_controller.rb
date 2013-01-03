class UsersController < ApplicationController
  force_ssl
  # GET /users
  # GET /users.json
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :admin_user, only: [:index]
  before_filter :deny_access,   only: [:edit, :update, :show, :destroy]

  def check_email
    puts request.url
    @user = User.find_by_email(params[:user][:email])
    respond_to do |format|
      format.json { render :json => !@user }
    end

  end

  def disable
    
  end
  
  def activate
      if request.get?
        user = User.find_by_confirm_token(params[:confirm_token])
        if user.activate?
          flash[:success] = "You have been activated"
          respond_to do |format|
          format.html {redirect_to root_path }            
          format.json  { render :json => user }           
          sign_in user
          end
        else
          flash[:error]= "We could not activate you.  Send us email."
          redirect_to :controller => 'logins', :action => 'login'
        end
      end

  end

def find_token
  if params[:remember_token]
    user = User.where("remember_token = ?",params[:remember_token])
    unless user.empty?
      respond_to do |format|
      format.json { render json: user.as_json(:only => [:fullname,:email]) }
    end
  else
    respond_to do |format|
      format.json { render json: "User Invalid" }
    end
  end
end

end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page], :per_page => 10)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    #@user.confirm_token = User.random_string(45)
    respond_to do |format|
      if @user.save
        #UserMailer.activate(@user).deliver
        #flash[:success] = "Welcome to My Twitter"
        format.html { redirect_to signin_path, notice: t("flash.signup") }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: Hash["message" => "Can't sign up"] }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = t("flash.save")
        if current_user.admin?
          sign_in User.find(current_user.id)
        else
          sign_in @user
        end
        format.html { redirect_to users_path }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy    
    flash[:notice] = t("flash.delete")
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  #def correct_user
  #  @user = User.find(params[:id])
  #  redirect_to root_path, :notice => "No correct user" unless current_user?(@user)
  #end
  
  def deny_access
    @user = User.find(params[:id])
    if current_user?(@user) || current_user.admin?
    else
      flash[:warning] = 'Only Admin Or Only correct user.'
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { render :text => 'Only Admin Or Only correct user.' }
      end
    end
  end
  

end
