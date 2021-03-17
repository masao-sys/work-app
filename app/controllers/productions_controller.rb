class ProductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_production, only: [:new, :create, :edit, :update, :destroy]

  def index
    @productions = Production.all.order(created_at: :desc)
  end

  private
  def if_not_production
    redirect_to productions_path unless current_user.department == 'production'
  end
end
