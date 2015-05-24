class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate, except: [:new, :create, :index, :show]

  def index
    @users = User.paginate(page: params[:page])
    respond_to do |format|
      format.html{ render :index }
      format.json{ render json: @users }
    end 
  end

  def show 
    @user = User.find(params[:id])
    @tweets = @user.tweets.paginate(page: params[:page])
    if @user 
      #want to combine user and tweets, might conflict 
      render json: @user
    else 
      render status: 400, nothing: true
    end 
  end

  def create
    @user = User.create(user_params)
    if @user.save 
      render json: @user 
    else 
      render status: 400, nothing: true 
    end 
  end 



  # how will authentification work as api ? 
  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user 
    else 
      render status: 400, nothing: true 
    end 
  end 

  def destroy 
    @user = User.find(params[:id])
    if @user.destroy
      render json: {}
    else 
      render status: 400, nothing: true 
    end 
  end 

  private 
  def user_params 
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end


