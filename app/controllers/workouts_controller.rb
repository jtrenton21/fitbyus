class WorkoutsController < ApplicationController
 
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout, notice: "Successfully Created Workout."
    else
      render :new
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
      params.require(:workout).permit(:name, :day, exercises_attributes:[:id, :name, :exercise_type, :target, :info, :outside_link, :workout_id, :_destroy, reps_attributes: [:id, :rep_amount, :rep_weight, :duration, :exercise_id, :_destroy]])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :exercise_type, :target, :info, :outside_link, :workout_id)
    
    end

    def rep_params
      params.require(:rep).permit(:rep_amount, :rep_weight, :duration, :exercise_id)
    end




end
