class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_admin, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to basic_profile_path
    end
  end

  def edit
    user = User.find(params[:id])
    @basic_profile = user.prepare_basic_profile
  end

  def update
    user = User.find(params[:id])
    @basic_profile = user.prepare_basic_profile
    @basic_profile.assign_attributes(basic_profile_params)
    if @basic_profile.save
      redirect_to account_path, notice: 'プロフィール更新！'
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
