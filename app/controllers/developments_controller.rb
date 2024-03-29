class DevelopmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_development, only: [:new, :create, :edit, :update, :destroy]

  def index
    @developments = Development.all.order(created_at: :desc)
  end

  def show
    @development = Development.find(params[:id])
  end

  def new
    @development = current_user.developments.build
  end

  def create
    @development = current_user.developments.build(development_params)
    if @development.save
      redirect_to development_path(@development), notice: '保存できたました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @development = current_user.developments.find(params[:id])
  end

  def update
    @development = current_user.developments.find(params[:id])
    if @development.update(development_params)
      redirect_to development_path(@development), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    development = current_user.developments.find(params[:id])
    development.destroy!
    redirect_to developments_path, notice: '削除に成功しました'
  end

  private
  def development_params
    params.require(:development).permit(:title, :content, images: [])
  end

  private
  def if_not_development
    redirect_to developments_path unless current_user.department == 'development'
  end
end
