class BasicProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_admin, only: [:edit]

  def show
    @basic_profile = current_user.basic_profile
  end

  def edit
    @basic_profile = current_user.build_basic_profile
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
