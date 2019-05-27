# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do
  let(:data) { JSON.parse(response.body, symbolize_names: true)[:data] }

  describe 'creating a animal' do
    before do
      post :create, params: animal_params
    end

    let(:person) { create(:person) }

    let(:animal_params) do
      { animal: animal }
    end

    context 'with valid attributes' do
      let(:animal) { attributes_for(:animal).merge(person_id: person.id) }
      it 'animal created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      let(:animal) { { name: nil } }
      it 'animal not created' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'updating a animal' do
    before do
      patch :update, params: animal_params.merge(id: animal_created.id)
    end

    let(:animal_created) { create(:animal) }

    let(:animal_params) do
      { animal: animal }
    end

    context 'with valid attributes' do
      let(:animal) { attributes_for(:animal, name: 'abcde') }
      it 'http status success' do
        expect(response).to have_http_status(:ok)
      end

      it 'updated' do
        expect(data[:attributes][:name]).to eq(animal[:name])
      end
    end

    context 'not updated' do
      let(:animal) { { name: nil } }
      it 'animal not updated' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'listing animals' do
    before do
      create(:animal, name: 'test1')
      create(:animal, name: 'test2')

      get :index, params: { q: filters }
    end

    context 'with filters' do
      let(:filters) { { name_eq: 'test1' } }

      it 'listing filtered results' do
        expect(data.size).to eq(1)
      end
    end

    context 'without filters' do
      let(:filters) { {} }

      it 'listing all results' do
        expect(data.size).to eq(2)
      end
    end
  end

  describe 'showing a animal' do
    before { get :show, params: { id: animal_id } }

    context 'with a valid id' do
      let(:animal_id) { create(:animal).id }

      it 'animal found' do
        expect(response).to have_http_status(:ok)
        expect(data[:id]).to eq(animal_id.to_s)
      end
    end

    context 'with a invalida id' do
      let(:animal_id) { 8889 }

      it 'animal not found' do
        expect(response).to have_http_status(:ok)
        expect(data).to be_blank
      end
    end
  end

  describe 'deleting a animal' do
    let(:animals) { create_list(:animal, 2) }

    before { delete :destroy, params: { id: animals.first.id } }

    it 'animal deleted' do
      expect(Animal.all.size).to eq(1)
    end
  end
end
