class User::RemindersController < ApplicationController
  def new
  	#@user = User.find(params[:id])
  	@reminder = Reminder.new
  end

  def create
  	@reminder = Reminder.new(reminder_params)
  	@reminder.user_id = current_user.id
  	@reminder.save!
  	redirect_to user_reminders_path
  end

  def index
  	@reminders = current_user.reminders.all
  end

  def show
    @reminder = current_user.reminders.find(params[:id])
  end

  def edit
  	@reminder = current_user.reminders.find(params[:id])
  end

  def update
  	@reminder = current_user.reminders.find(params[:id])
  	@reminder.update(reminder_params)
  	redirect_to user_reminder_path(@reminder)
  end

  def destroy
    @reminder = current_user.reminders.find(params[:id])
    @reminder.destroy
     flash[:notice]= 'メモを削除しました'
    redirect_to user_reminders_path
  end

  private
  def reminder_params
    params.require(:reminder).permit(:date,:note,:user_id,:title)
  end
end
