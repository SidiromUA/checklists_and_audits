# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :checklist

  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { in: 12..40 }
end
