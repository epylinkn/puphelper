class Api::V1::DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all.order(name: :asc)
    render json: @dogs
  end

  def show
    if @dog
      render json: @dog
    else
      render json: @dog.errors
    end
  end

  def new
    @dog = dog.new
  end

  def edit
  end

  def create
    @dog = dog.new(dog_params)

    if @dog.save
      render json: @dog
    else
      render json: @dog.errors
    end
  end

  def update
  end

  def destroy
    @dog.destroy

    render json: { notice: 'dog was successfully removed.' }
  end

  private

    def set_dog
      @dog = dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :sex, :breed, :current_weight, :birthdate, :age)
    end
end
