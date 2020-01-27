class User::UserReportsController < ApplicationController
	def create
	  @user = User.find(params[:user_id])
	  report = current_user.reporting_relationships.new(report_params)
      report.reported_user_id = @user.id
	  report.save!
	  redirect_to root_path
	end

    private
    def report_params
      params.require(:user_report).permit(:report_user_id, :reported_user_id, :report_message)
    end
end
