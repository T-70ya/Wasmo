class Content < ApplicationRecord

  validates :title, presence: true
  validates :money, presence: true, numericality: true
end
