class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @informations = current_user.favorite_informations.order(created_at: :desc)
  end
end
