class User::UserReportsController < ApplicationController
	def create
	  report = current_user.reporting_relationships.build(reported_user_id: params[:user_id])
	  report.save!
	  redirect_to root_path
	end

    private
    def report_params
      params.require(:active_reports).permit(:report_user_id, :reported_user_id, :report_message)
    end
end
