class User::CatsController < ApplicationController
  def new
  	@cat = Cat.new
  end

  def create
    cat = Cat.new(cat_params)
  end

  def index
  end

  def edit
  	cat = Cat.find(params[:id])

  end

  private

  def cat_params
      params.require(:cat).permit(:user_id, :image_id, :name, :sex, :age, :breed, :weight, :blood_type, :story, :purpose, :condition_sex, :condition_breed, :condition_age, :condition_blood_type, :condition_weight, :term, :note, :status)
  end

end
