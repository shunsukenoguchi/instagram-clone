class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  def liked_by(user)
  # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end


  attr_accessor :search_user_name

  def execute
    Post.ransack(user_name_cont: @search_user_name).result
  end
end
