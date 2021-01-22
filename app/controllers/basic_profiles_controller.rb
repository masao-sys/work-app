class BasicProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @basic_profile = current_user.basic_profile
  end

  def edit
  end
end
