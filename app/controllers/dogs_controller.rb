class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show edit update destroy ]

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    render :show
  end

  def new
    @dog = Dog.new
  end

  def edit
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.is_metric = params[:units] == "kilograms"

    if @dog.save
      redirect_to @dog, notice: "Dog was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog, notice: "Dog was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy

    redirect_to dogs_url, notice: "Dog was successfully destroyed."
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :sex, :breed, :current_weight, :birthdate, :age)
    end
end
