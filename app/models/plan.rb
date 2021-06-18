class Plan < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :user_id, uniqueness: { scope: :target_month }
    validates :target, numericality: true
    validates :target_month
  end
end
