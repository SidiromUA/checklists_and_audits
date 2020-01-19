# frozen_string_literal: true

class Question < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { in: 12..40 }

  belongs_to :item

end
