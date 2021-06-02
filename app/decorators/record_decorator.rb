class RecordDecorator
  attr_accessor :record
  delegate :name, :description, :active_picture_id, to: :record

  def initialize(record)
    @record = record
  end
end
