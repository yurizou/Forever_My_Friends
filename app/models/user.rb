class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :genres, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :notices, dependent: :destroy
end
