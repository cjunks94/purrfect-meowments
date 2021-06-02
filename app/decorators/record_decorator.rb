# frozen_string_literal: true

class RecordDecorator
  attr_accessor :record

  delegate :name, :description, to: :record

  def initialize(record)
    @record = record
  end
end
