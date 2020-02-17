class User::CatsController < ApplicationController

  def new
  	@cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
    redirect_to user_user_path(current_user.id)
    flash[:notice]= 'MY CATを作成しました。'
    else
    redirect_to user_user_path(current_user.id)
    end
  end

  def index
    @cats = Cat.all
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
    redirect_to user_user_path(current_user.id)
    flash[:notice]= 'MY CATを編集しました。'
    else
      render :edit
    end
  end

  def destroy
  	 @cat = Cat.find(params[:id])
  	 @cat.destroy
  	 flash[:notice]= 'ネコ情報を削除しました'
  	 redirect_to user_user_path(current_user.id)
  end

  private

  def cat_params
      params.require(:cat).permit(:user_id, :name, :sex, :age, :breed, :weight, :blood_type, :story, :purpose, :condition_sex, :condition_breed, :condition_age, :condition_blood_type, :condition_weight, :date,:area,:term, :note, :status, :status,cat_images_images:[])
  end

end
