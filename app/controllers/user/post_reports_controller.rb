class User::PostReportsController < ApplicationController
  def new
      @report = PostReport.new
      @post = Post.find(params[:post_id])
  end
	def create
	    @post = Post.find(params[:post_id])
      @report = current_user.post_reports.new(report_params)
      @report.post_id = @post.id
    if @report.save
      redirect_to user_post_path(@post)
      flash[:notice] = "投稿を通報しました。"
    else
      flash.now[:alart]= "通報に失敗しました。"
      render :new
    end
	end

	private
	def report_params
      params.require(:post_report).permit(:post_id, :user_id,:report_message)
    end

end
