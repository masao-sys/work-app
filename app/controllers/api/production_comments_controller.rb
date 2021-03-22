class Api::ProductionCommentsController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :if_not_production, only: [:new, :create, :edit, :update, :destroy]

  def index
    production = Production.find(params[:production_id])
    production_comments = production.production_comments
    render json: production_comments, include: { user: [ :custom_profile] }
  end

  def create
    production = Production.find(params[:production_id])
    @production_comment = production.production_comments.build(production_comment_params.merge!(user_id: current_user.id))
    @production_comment.save!
    render json: @production_comment, include: { user: [ :custom_profile] }
  end

  private
  def production_comment_params
    params.require(:production_comment).permit(:content)
  end

  private
  def if_not_production
    redirect_to productions_path unless current_user.department == 'production'
  end
end
