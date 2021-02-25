class ManagementCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_management, only: [:new, :create, :edit, :update, :destroy]

  def new
    management = Management.find(params[:management_id])
    @management_comment = management.management_comments.build
  end

  def create
    management = Management.find(params[:management_id])
    @management_comment = management.management_comments.build(management_comment_params.merge!(user_id: current_user.id))
    if @management_comment.save
      redirect_to management_path(management), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    management = Management.find(params[:management_id])
    @management_comment = management.management_comments.find(params[:id])
  end

  def update
    management = Management.find(params[:management_id])
    @management_comment = management.management_comments.find(params[:id])
    if @management_comment.update(management_comment_params)
      redirect_to management_path(management), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    management = Management.find(params[:management_id])
    management_comment = management.management_comments.find(params[:id])
    management_comment.destroy!
    redirect_to management_path(management), notice: '削除に成功しました'
  end

  private
  def management_comment_params
    params.require(:management_comment).permit(:content)
  end

  private
  def if_not_management
    redirect_to managements_path unless current_user.department == 'management'
  end
end
