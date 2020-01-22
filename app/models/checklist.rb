# frozen_string_literal: true

class Checklist < ApplicationRecord
  belongs_to :user

  has_many :questions

  # accepts_nested_attributes_for :questions, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { maximum: 40 }
end
