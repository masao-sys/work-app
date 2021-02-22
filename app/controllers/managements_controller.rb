class ManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_management, only: [:new, :create, :edit, :update, :destroy]

  def index
    @managements = Management.all.order(created_at: :desc)
  end

  private
  def if_not_management
    redirect_to root_path unless current_user.department == 'management'
  end
end
