# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :room

  validates :from, presence: true
  validates :content, presence: true
end
