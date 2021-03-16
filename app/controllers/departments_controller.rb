class DepartmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @basic_profile_managements = BasicProfile.where(department: 'management')
    @basic_profile_sales = BasicProfile.where(department: 'sales')
    @basic_profile_productions = BasicProfile.where(department: 'production')
    @basic_profile_developments = BasicProfile.where(department: 'development')
  end
end
