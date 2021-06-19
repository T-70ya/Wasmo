class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contents, dependent: :destroy
  has_many :plans, dependent: :destroy
  
  with_options presence: true do
    validates :username
  end


end
