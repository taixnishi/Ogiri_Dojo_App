class Theme < ApplicationRecord
    validates :content, presence: true
    mount_uploader :image, ImageUploader
    belongs_to :user 
    has_many :answers, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :likes, dependent: :destroy

    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end
end
