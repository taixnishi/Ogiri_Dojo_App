class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  
  validates :profile, length: { maximum: 200 } #追記
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :themes, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_themes, through: :likes, source: :theme

end
