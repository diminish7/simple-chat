# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    name { Faker::App.name }
  end
end
