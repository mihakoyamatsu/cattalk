class Admin::UserReportsController < ApplicationController
  def index
  	@users = UserReport.all
  end

  def show
  end
end
