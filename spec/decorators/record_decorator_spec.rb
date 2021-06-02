require 'rails_helper'

describe RecordDecorator do
  context 'delegations' do
    subject { RecordDecorator.new(build(:record)) }

    it { is_expected.to delegate_method(:name).to(:record) }
    it { is_expected.to delegate_method(:description).to(:record) }
    it { is_expected.to delegate_method(:active_picture_id).to(:record) }
  end

  describe '#initialize' do
    it 'is initialized with a record' do
      record = create(:record)
      decorator = RecordDecorator.new(record)

      expect(decorator.record).to eq(record)
    end
  end
end
