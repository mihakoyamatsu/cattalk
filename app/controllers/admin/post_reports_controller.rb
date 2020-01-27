class Admin::PostReportsController < ApplicationController
  def index
  	@reports = PostReport.where(is_deleted: nil)
  end

  def show
    @report = PostReport.find(params[:id])
    @post = Post.find_by(id:@report.post_id)
  end

  def hide
  	@report = PostReport.find(params[:id])
  	@report.update(is_deleted: true)
  	redirect_to admin_post_reports_path
  end
end
