class Content < ApplicationRecord

  validates :title, presence: true
  validates :money, presence: true
end
