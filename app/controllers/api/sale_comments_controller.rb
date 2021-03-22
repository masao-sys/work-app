class Api::SaleCommentsController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :if_not_sale, only: [:new, :create, :edit, :update, :destroy]

  def index
    sale = Sale.find(params[:sale_id])
    sale_comments = sale.sale_comments
    render json: sale_comments, include: { user: [ :custom_profile] }
  end

  def create
    sale = Sale.find(params[:sale_id])
    @sale_comment = sale.sale_comments.build(sale_comment_params.merge!(user_id: current_user.id))
    @sale_comment.save!
    render json: @sale_comment, include: { user: [ :custom_profile] }
  end

  private
  def sale_comment_params
    params.require(:sale_comment).permit(:content)
  end

  private
  def if_not_sale
    redirect_to sales_path unless current_user.department == 'sales'
  end
end
