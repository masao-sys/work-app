class InformationsController < ApplicationController
  def index
    @informations = Information.all.order(created_at: :desc)
  end
end
