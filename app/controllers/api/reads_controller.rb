class Api::ReadsController < Api::ApplicationController
  before_action :authenticate_user!

  def show
    information = Information.find(params[:information_id])
    read_status = current_user.has_read?(information)

    render json: { hasRead: read_status }
  end

  def create
    information = Information.find(params[:information_id])
    information.reads.create!(user_id: current_user.id)

    render json: { status: 'ok' }
  end

  def destroy
    information = Information.find(params[:information_id])
    read = information.reads.find_by!(user_id: current_user.id)
    read.destroy!

    render json: { status: 'ok' }
  end
end
