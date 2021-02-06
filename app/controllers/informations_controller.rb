class InformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @informations = Information.all.order(created_at: :desc)
  end

  def show
    @information = Information.find(params[:id])
  end

  def new
    @information = current_user.informations.build
  end

  def create
    @information = current_user.informations.build(information_params)
    if @information.save
      redirect_to information_path(@information), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @information = current_user.informations.find(params[:id])
  end

  def update
    @information = current_user.informations.find(params[:id])
    if @information.update(information_params)
      redirect_to information_path(@information), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    information = current_user.informations.find(params[:id])
    information.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def information_params
    params.require(:information).permit(:title, :content, images: [])
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
