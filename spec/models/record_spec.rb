# frozen_string_literal: true

require 'rails_helper'

describe Record, type: :model do
  it 'can be saved with an attachment' do
    record = create(:record)

    expect(record.name).to eq('test')
    expect(record.description).to eq('this is a record of a cat')
  end
end
