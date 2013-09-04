class UsersController < ApplicationController
  include WorkoutsHelper
  

  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]

  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
   
  end

  def dashboard
    @workouts = User.find(current_user.id).workouts
    @exercises = User.find(current_user.id).exercises
   
    # @workout = Workout.new
    # @exercise = Exercise.new
  end
  
  def newworkout
    @workout = User.find(current_user.id).workouts.includes(params[:id]).new
  end
 
  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts.paginate(page: params[:page])
    @workout = Workout.new  
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Fit By Us !"
      redirect_to dashboard_path

    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)

      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params

      params.require(:user).permit(:name, :email, :gender, :bday, :height, :weight, :password, :password_confirmation, userroutins_attributes:[:id, :routin_id])
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end



end