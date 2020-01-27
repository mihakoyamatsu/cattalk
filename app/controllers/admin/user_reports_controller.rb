class Admin::UserReportsController < ApplicationController
  def index
  	@reports = UserReport.all
  	#@users = User.where(id:@reports.reported_user_id)
  end

  def show
    @report = UserReport.find(params[:id])
  end

  def hide
  	@report = UserReport.find(params[:id])
  	@report.update(is_deleted: true)
  	redirect_to admin_user_reports_path
  end
end
