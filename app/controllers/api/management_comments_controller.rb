class Api::ManagementCommentsController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :if_not_management, only: [:new, :create, :edit, :update, :destroy]

  def index
    management = Management.find(params[:management_id])
    management_comments = management.management_comments
    render json: management_comments, include: { user: [ :custom_profile] }
  end

  def create
    management = Management.find(params[:management_id])
    @management_comment = management.management_comments.build(management_comment_params.merge!(user_id: current_user.id))
    @management_comment.save!
    render json: @management_comment, include: { user: [ :custom_profile] }
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
