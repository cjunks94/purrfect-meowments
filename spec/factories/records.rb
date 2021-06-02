FactoryBot.define do
  factory :record do
    name { 'test' }
    description { 'this is a record of a cat' }

    active_picture_id { 1 }
  end
end
