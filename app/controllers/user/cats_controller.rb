class User::CatsController < ApplicationController

  def new
  	@cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
    flash[:notice]= 'MY CATを作成しました。'
    redirect_to user_user_path(current_user.id)
    else
    flash.now[:alart]= 'MY CAT作成失敗しました。'
    render :new
    end
  end

  def index
    @cats = Cat.where(purpose:0 ,purpose:1)
    if params[:sort] == "0"
        @cats_purpose = Cat.where(purpose: 0)
    elsif params[:sort] == "1"
        @cats_purpose = Cat.where(purpose: 1)
    else
        @cats_purpose = []
    end
  end

  def edit
  	@cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
    flash[:notice]= 'MY CATを編集しました。'
    redirect_to user_user_path(current_user.id)
    else
    flash.now[:alart]= 'MY CATを編集に失敗しました。'
    render :edit
    end
  end

  def destroy
  	 @cat = Cat.find(params[:id])
  	 @cat.destroy
  	 flash[:notice]= 'MY CATを削除しました'
  	 redirect_to user_user_path(current_user.id)
  end

  private

  def cat_params
      params.require(:cat).permit(:user_id, :name, :sex, :age, :breed, :weight, :blood_type, :story, :purpose, :condition_sex, :condition_breed, :condition_age, :condition_blood_type, :condition_weight, :date,:area,:term, :note, :status, :status,cat_images_images:[])
  end

end
