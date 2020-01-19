# frozen_string_literal: true

class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { maximum: 40 }

  has_many :questions

  belongs_to :user
end
