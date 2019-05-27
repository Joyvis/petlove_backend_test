# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  let(:data) { JSON.parse(response.body, symbolize_names: true)[:data] }

  describe 'creating a person' do
    before do
      post :create, params: person_params
    end

    let(:person_params) do
      { person: person }
    end

    context 'with valid attributes' do
      let(:person) { attributes_for(:person) }
      it 'person created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      let(:person) { { name: nil } }
      it 'person not created' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'updating a person' do
    before do
      patch :update, params: person_params.merge(id: person_created.id)
    end

    let(:person_created) { create(:person) }

    let(:person_params) do
      { person: person }
    end

    context 'with valid attributes' do
      let(:person) { attributes_for(:person, name: 'abcde') }
      it 'http status success' do
        expect(response).to have_http_status(:ok)
      end

      it 'updated' do
        expect(data[:attributes][:name]).to eq(person[:name])
      end
    end

    context 'not updated' do
      let(:person) { { name: nil } }
      it 'person not updated' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'listing people' do
    before do
      create(:person, name: 'test1')
      create(:person, name: 'test2')

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

  describe 'showing a person' do
    before { get :show, params: { id: person_id } }

    context 'with a valid id' do
      let(:person_id) { create(:person).id }

      it 'person found' do
        expect(response).to have_http_status(:ok)
        expect(data[:id]).to eq(person_id.to_s)
      end
    end

    context 'with a invalida id' do
      let(:person_id) { 8889 }

      it 'person not found' do
        expect(response).to have_http_status(:ok)
        expect(data).to be_blank
      end
    end
  end

  describe 'deleting a person' do
    let(:people) { create_list(:person, 2) }

    before { delete :destroy, params: { id: people.first.id } }

    it 'person deleted' do
      expect(Person.all.size).to eq(1)
    end
  end
end
