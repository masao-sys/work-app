class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_sale, only: [:new, :create, :edit, :update, :destroy]

  def index
    @sales = Sale.all.order(created_at: :desc)
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = current_user.sales.build
  end

  def create
    @sale = current_user.sales.build(sale_params)
    if @sale.save
      redirect_to sale_path(@sale), notice: '保存できたました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @sale = current_user.sales.find(params[:id])
  end

  def update
    @sale = current_user.sales.find(params[:id])
    if @sale.update(sale_params)
      redirect_to sale_path(@sale), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    sale = current_user.sales.find(params[:id])
    sale.destroy!
    redirect_to sales_path, notice: '削除に成功しました'
  end

  private
  def sale_params
    params.require(:sale).permit(:title, :content, images: [])
  end

  private
  def if_not_sale
    redirect_to sales_path unless current_user.department == 'sales'
  end
end
