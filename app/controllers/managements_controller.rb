class ManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_management, only: [:new, :create, :edit, :update, :destroy]

  def index
    @managements = Management.all.order(created_at: :desc)
  end

  def show
    @management = Management.find(params[:id])
  end

  def new
    @management = current_user.managements.build
  end

  def create
    @management = current_user.managements.build(management_params)
    if @management.save
      redirect_to management_path(@management), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @management = current_user.managements.find(params[:id])
  end

  def update
    @management = current_user.managements.find(params[:id])
    if @management.update(management_params)
      redirect_to management_path(@management), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    management = current_user.managements.find(params[:id])
    management.destroy!
    redirect_to managements_path, notice: '削除に成功しました'
  end

  private
  def management_params
    params.require(:management).permit(:title, :content, images: [])
  end

  private
  def if_not_management
    redirect_to managements_path unless current_user.department == 'management'
  end
end
