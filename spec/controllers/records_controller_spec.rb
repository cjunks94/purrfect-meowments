require 'rails_helper'

describe Api::V1::RecordsController, type: :controller do
  render_views

  describe 'index' do
    it 'returns a list of all records ordered by most recent first' do
      old_record = create(:record, created_at: 2.weeks.ago)
      new_record = create(:record)

      expected_json = [
        { id: new_record.id, name: new_record.name },
        { id: old_record.id, name: old_record.name }
      ].to_json

      get :index

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_json)
    end
  end

  describe 'show' do
    it 'returns the record' do
      record = create(:record)

      expected_json = {
        id: record.id,
        name: record.name,
        description: record.description,
        picture: record.picture
      }.to_json

      get :show, params: { id: record.id }

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_json)
    end
  end

  describe 'create' do
    it 'adds a new record' do
      record_params = { record: { name: 'meownster cat', description: 'a scary cat', file_path: Rails.root.join('spec', 'files', 'cat.jpeg')}}

      get :create, params: record_params

      expect(response.status).to eq(200)
    end
  end
end

get :create, params: { 'record': { 'name': 'meownster cat', 'description': 'a scary cat', 'file_path': Rails.root.join('spec', 'files', 'cat.jpeg')}}
