class Content < ApplicationRecord

  belongs_to :user
  has_one :plan

  with_options presence: true do
    validates :title
    validates :money, numericality: true
    validates :user_id
  end
end
