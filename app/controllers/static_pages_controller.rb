class StaticPagesController < ApplicationController
  
def home
    if signed_in?
      @workout  = current_user.workouts.build
      # @exercise  = current_user.exercisess.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
      
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end