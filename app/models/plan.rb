class Plan < ApplicationRecord
  belongs_to :user
  has_one :content

  validates :target,       null: false
end
