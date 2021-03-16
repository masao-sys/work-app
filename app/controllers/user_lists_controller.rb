class UserListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @management_users = BasicProfile.where(department: 'management')
    @sale_users = BasicProfile.where(department: 'sales')
    @production_users = BasicProfile.where(department: 'production')
    @development_users = BasicProfile.where(department: 'development')
  end
end
