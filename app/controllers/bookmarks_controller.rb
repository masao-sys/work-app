class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    information = Information.find(params[:information_id])
    information.bookmarks.create!(user_id: current_user.id)
    redirect_to information_path(information)
  end

  def destroy
    information = Information.find(params[:information_id])
    bookmark = information.bookmarks.find_by!(user_id: current_user.id)

    bookmark.destroy!
    redirect_to information_path(information)
  end
end
