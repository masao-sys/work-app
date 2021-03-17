class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_sale, only: [:new, :create, :edit, :update, :destroy]

  def index
    @sales = Sale.all.order(created_at: :desc)
  end


end
