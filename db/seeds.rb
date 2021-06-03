# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

record_1 = Record.create(name: 'my_cat.jpg', description: 'my fluffykins')
record_1.picture.attach(io: File.open(Rails.root.join('spec', 'files', 'cat.jpeg')), filename: 'cat.jpeg')

record_2 = Record.create(name: 'mr_sprinkles.png', description: 'sprinks')
record_2.picture.attach(io: File.open(Rails.root.join('spec', 'files', 'sprinkles.jpeg')), filename: 'sprinkles.jpeg')

record_3 = Record.create(name: '2021_02_02_15665.img', description: '')
record_3.picture.attach(io: File.open(Rails.root.join('spec', 'files', 'gizmo.jpeg')), filename: 'gizmo.jpeg')
