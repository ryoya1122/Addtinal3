class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true
	validates :body,    length: { maximum: 200 }
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
    def self.search(method,search)
    			if method == "forward_match"
                        @books = Book.where("title LIKE?","#{search}%")
                elsif method == "backward_match"
                        @books = Book.where("title LIKE?","%#{search}")
                elsif method == "perfect_match"
                        @books = Book.where("title LIKE?","#{search}")
                elsif method == "partial_match"
                        @books = Book.where("title LIKE?","%#{search}%")
                else
                        @books = Book.all
                end
	end
end