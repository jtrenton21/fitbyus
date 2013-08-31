class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
    
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to @exercise, notice: "Successfully Created Exercise."
    else
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(exercise_params)

      redirect_to @exercise, notice: "Successfully Updated Exercise."
    else
      render :edit
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    redirect_to exercises_url, notice: "Successfully Deleted Exercise."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_exercise
    #   @exercise = exercise.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:name, :day, exercises_attributes:[:id, :name, :exercise_type, :target, :info, :outside_link, :exercise_id, :_destroy, reps_attributes: [:id, :rep_amount, :rep_weight, :duration, :exercise_id, :_destroy]])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :exercise_type, :target, :info, :outside_link, :workout_id, reps_attributes: [:id, :rep_amount, :rep_weight, :duration, :exercise_id, :_destroy])
    
    end

    def rep_params
      params.require(:rep).permit(:rep_amount, :rep_weight, :duration, :exercise_id)
    end




end
