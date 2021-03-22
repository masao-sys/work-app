class Api::DevelopmentCommentsController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :if_not_development, only: [:new, :create, :edit, :update, :destroy]

  def index
    development = Development.find(params[:development_id])
    development_comments = development.development_comments
    render json: development_comments, include: { user: [ :custom_profile] }
  end

  def create
    development = Development.find(params[:development_id])
    @development_comment = development.development_comments.build(development_comment_params.merge!(user_id: current_user.id))
    @development_comment.save!
    render json: @development_comment, include: { user: [ :custom_profile] }
  end

  private
  def development_comment_params
    params.require(:development_comment).permit(:content)
  end

  private
  def if_not_development
    redirect_to developments_path unless current_user.department == 'development'
  end
end
