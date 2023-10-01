class User < ApplicationRecord
  
  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.last_name = 'ゲスト'
      user.first_name = 'さん'
      user.last_name_kana = 'げすと'
      user.first_name_kana = 'さん'
      user.telephone_number = '000000000'
    end
  end
  
  
  
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
