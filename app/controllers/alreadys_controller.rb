class AlreadysController < ApplicationController
  before_action :authenticate_user!

  def index
    information = Information.find(params[:information_id])
    @users = information.read_user
  end
end
