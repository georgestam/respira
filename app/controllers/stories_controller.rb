class StoriesController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :destroy_user_if_current_user, only: %i[index show]

  def index
    @story = Story.all
    policy_scope(Story)
  end

  def show
    @story = Story.friendly.find(params[:id])
    authorize @story
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :locale, :photo, :photo_cache)
  end

end
