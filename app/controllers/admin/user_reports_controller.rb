class Admin::UserReportsController < ApplicationController
  def index
  	@reports = UserReport.all
  	#@users = User.where(id:@reports.reported_user_id)
  end

  def show
  end
end
