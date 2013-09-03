module WorkoutsHelper

def index
    @workout = Workout.new
end

def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      flash[:success] = "Workout created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_url
  end

  private

   def workout_params
      params.require(:workout).permit(:name, :day, :workout_type, exercises_attributes:[:id, :name, :exercise_type, :target, :info, :outside_link, :workout_id, :_destroy, reps_attributes: [:id, :rep_amount, :rep_weight, :duration, :exercise_id, :_destroy]])
    end

    def correct_user
      @workout = current_user.workouts.find_by_id(params[:id])
      redirect_to root_url if @workout.nil?
    end
end


