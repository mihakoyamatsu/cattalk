class User::UserReportsController < ApplicationController
	def new
      report = User_report.new
	end
	def create
	  @user = User.find(params[:user_report][:report_user_id])
      current_user.report!(@user)
      #report.reported_user_id = @user.id
	  #report.save!
	  redirect_to user_user_path(@user)
	end

    private
    def report_params
      params.require(:active_reports).permit(:report_user_id, :reported_user_id, :report_message)
    end
end
