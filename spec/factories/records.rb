# frozen_string_literal: true

FactoryBot.define do
  factory :record do
    description { 'this is a record of a cat' }

    after :build do |record|
      record.picture.attach(io: File.open(Rails.root.join('spec', 'files', 'cat.jpeg')), filename: 'cat.jpeg', content_type: 'image/jpg')
    end
  end
end

# record.new(name: 'chris', description: 'we', active_picture_id: 1)
# record.pictures.attach(io: File.open(Rails.root.join('spec', 'files', 'cat.jpeg')), filename: 'cat.jpeg', content_type: 'image/jpg')
