# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    room
    from { Faker::Name.name }
    content { Faker::Lorem.paragraph }
  end
end
