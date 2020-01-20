class Admin::PostReportsController < ApplicationController
  def index
  	@reports = PostReport.all
  end

  def show
  end
end
