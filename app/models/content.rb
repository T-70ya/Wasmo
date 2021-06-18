class Content < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :money, numericality: true
    validates :start_time
    validates :user_id
  end

  def self.search(keyword)
    where(["title like? OR money like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
