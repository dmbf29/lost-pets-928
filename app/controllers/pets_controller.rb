class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      # showing the new.html.erb form again
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :address, :found_on)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
