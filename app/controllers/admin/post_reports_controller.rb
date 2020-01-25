class Admin::PostReportsController < ApplicationController
  def index
  	@reports = PostReport.where(is_deleted: nil)
  end

  def show
  end

  def hide
  	@report = PostReport.find(params[:id])
  	@report.update(is_deleted: true)
  	redirect_to admin_post_reports_hide_path(@report)
  end
end
