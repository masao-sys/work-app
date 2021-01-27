class BasicProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_admin, only: [:edit, :update]

  def show
    @basic_profile = current_user.basic_profile
  end

  def edit
    @basic_profile = current_user.prepare_basic_profile
  end

  def update
    @basic_profile = current_user.prepare_basic_profile
    @basic_profile.assign_attributes(basic_profile_params)
    if @basic_profile.save
      redirect_to basic_profile_path, notice: 'プロフィール更新！'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def basic_profile_params
    params.require(:basic_profile).permit(
      :name,
      :birthday,
      :gender,
      :department
    )
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
