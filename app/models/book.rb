class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, keyword)
    if search == "perfect_match"
      @book = Book.where("title LIKE?", "#{keyword}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?", "#{keyword}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?", "%#{keyword}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?", "%#{keyword}%")
    else
      @book = Book.all
    end
  end



end

