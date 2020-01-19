# frozen_string_literal: true

class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { maximum: 40 }

  belongs_to :user
end
