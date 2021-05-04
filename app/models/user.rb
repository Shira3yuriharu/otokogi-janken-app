class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do         
    validates :nickname,uniqueness: { case_sensitive: false },  length: { maximum: 8 }
    validates :email, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: { case_sensitive: false }
  end

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :travel_selects
end
