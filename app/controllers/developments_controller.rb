class DevelopmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_development, only: [:new, :create, :edit, :update, :destroy]

  def index
    @developments = Development.all.order(created_at: :desc)
  end

  private
  def if_not_development
    redirect_to developments_path unless current_user.department == 'development'
  end
end
