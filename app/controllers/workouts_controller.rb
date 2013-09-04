class WorkoutsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy
  
  def index 
    @workouts = Workout.includes(params[:id]).all
    @exercises = Exercise.all

  end

  def userworkout
    @workouts = User.find(current_user.id).workouts
    @exercises = User.find(current_user.id).exercises
  end


  def show
    # if current_user? 
    @workout = Workout.find(params[:id])
   

    # else
    #   @workout = current_user.workouts.find(params[:id])
    # end
  end

  def new
    @workout = User.find(current_user.id).workouts.includes(params[:id]).new
    @exercise = User.find(current_user.id).exercises.new
  end
  def create
   # @workout = Workout.new(workout_params)
   # @workout.save
   if current_user.workouts.create(workout_params)
      
      flash[:success] = "Workout Created!"
      redirect_to userworkout_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update_attributes(workout_params)

      redirect_to @workout, notice: "Successfully Updated Workout."
    else
      render :edit
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_url, notice: "Successfully Deleted Workout."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_workout
    #   @workout = Workout.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:name, :day, :workout_type, :routins_attributes, exercises_attributes:[:id, :name, :exercise_type, :target, :info, :outside_link, :workout_id, :_destroy, reps_attributes: [:id, :rep_amount, :rep_weight, :duration, :exercise_id, :_destroy]])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :exercise_type, :target, :info, :outside_link, :workout_id)
    
    end

    def rep_params
      params.require(:rep).permit(:rep_amount, :rep_weight, :duration, :exercise_id)
    end
    def correct_user
      @workout = current_user.workouts.find_by_id(params[:id])
      @exercise = current_user.exercises.find_by_id(params[:id])
      redirect_to root_url if @workout.nil?
    end
end
