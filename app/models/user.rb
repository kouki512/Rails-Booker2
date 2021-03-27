class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  
  # def favorited_by?(book)
  #   favorites.where(post_id: book.id).exists?
  # end
  
  validates :name, presence:true, uniqueness:true, length:{in: 2..20}
  validates :introduction,length:{maximum: 50}
end
