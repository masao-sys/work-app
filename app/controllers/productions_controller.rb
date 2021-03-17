class ProductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_production, only: [:new, :create, :edit, :update, :destroy]

  def index
    @productions = Production.all.order(created_at: :desc)
  end

  def show
    @production = Production.find(params[:id])
  end

  def new
    @production = current_user.productions.build
  end

  def create
    @production = current_user.productions.build(production_params)
    if @production.save
      redirect_to production_path(@production), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  private
  def production_params
    params.require(:production).permit(:title, :content, images: [])
  end

  private
  def if_not_production
    redirect_to productions_path unless current_user.department == 'production'
  end
end
