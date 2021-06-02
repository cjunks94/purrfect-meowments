require 'rails_helper'

describe Api::V1::RecordsController, type: :controller do
  context 'index' do
    it 'returns a list of all records ordered by most recent first' do
      old_record = create(:record, created_at: 2.weeks.ago)
      create(:record, created_at: 1.weeks.ago)
      new_record = create(:record)

      get :index

      expect(response.status).to eq(200)
      expect(@controller.instance_variable_get(:@records)).to eq(Record.order('created_at DESC'))
    end
  end
end
