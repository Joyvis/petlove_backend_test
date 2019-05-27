# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    people = Person.ransack(params[:q]).result
    render_success people
  end

  def show
    person = Person.find_by(id: params[:id])
    render_success person
  end

  def create
    person = Person.new(person_params)
    if person.save
      render_success person
    else
      render_error person
    end
  end

  def update
    person = Person.find(params[:id])
    if person.update_attributes(person_params)
      render_success person
    else
      render_error person
    end
  end

  def destroy
    person = Person.find(params[:id])
    person.destroy

    render_success person
  end

  private

  def person_params
    params.require(:person)
          .permit(:name, :identification_document, :born_date)
  end
end
