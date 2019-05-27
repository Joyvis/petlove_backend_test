# frozen_string_literal: true

class AnimalsController < ApplicationController
  def index
    animals = Animal.ransack(params[:q]).result
    render_success animals
  end

  def show
    animal = Animal.find_by(id: params[:id])
    render_success animal
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      render_success animal
    else
      render_error animal
    end
  end

  def update
    animal = Animal.find(params[:id])
    if animal.update_attributes(animal_params)
      render_success animal
    else
      render_error animal
    end
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy

    render_success animal
  end

  private

  def animal_params
    params.require(:animal)
          .permit(:name, :monthly_cost, :kind_cd, :person_id)
  end
end
