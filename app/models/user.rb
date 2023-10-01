class User < ApplicationRecord
  
  # def self.guest
  # find_or_create_by!(email: 'aaa@aaa.com') do |user|
  #   user.password = SecureRandom.urlsafe_base64
  #   user.password_confirmation = user.password
  #   user.nickname = 'ゲスト'
  #   user.birthday = '2000-01-01'
  # end
  # end
  
  
  
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
