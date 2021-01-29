class CustomProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @custom_profile = current_user.prepare_custom_profile
  end

  def update
    @custom_profile = current_user.prepare_custom_profile
    @custom_profile.assign_attributes(custom_profile_params)
    if @custom_profile.save
      redirect_to basic_profile_path, notice: 'プロフィール更新！'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def custom_profile_params
    params.require(:custom_profile).permit(
      :nickname,
      :birthplace,
      :introduction
    )
  end
end
