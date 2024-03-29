class Book < ApplicationRecord
#   has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy  #Book.commentsで、投稿が所有するコメントを取得できる。
  
  def favorited?(user)
     favorites.where(user_id: user.id).exists?
  end
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end