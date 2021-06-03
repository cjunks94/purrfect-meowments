# frozen_string_literal: true

json.array! @records do |record|
  json.id record.id
  json.name record.name
end
