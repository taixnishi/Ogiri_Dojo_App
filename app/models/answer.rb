class Answer < ApplicationRecord
  validates :answer, presence: true
  belongs_to :user 
  belongs_to :theme
  has_many :favorites, dependent: :destroy

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
  # def self.create_all_ranks #Answerクラスからデータを取ってくる処理なのでクラスメソッド！
  #   Answer.find(Favorite.group(:answer_id).order('count(answer_id) desc').limit(3).pluck(:answer_id))
  # end
end
