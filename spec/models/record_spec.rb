require 'rails_helper'

describe Record, type: :model do
  it 'can be saved with an attachment' do
    record = create(:record)

    expect(record.name).to eq('test')
    expect(record.description).to eq('this is a record of a cat')
    expect(record.active_picture_id).to eq(1)
  end
end
