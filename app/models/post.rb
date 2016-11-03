# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  #include Notificable

  #Relación => Pertenece a un usuario
  belongs_to :user
  #Relación => Tiene muchos likes
  has_many :likes, foreign_key: :item_id
  scope :nuevos, ->{ order("created_at desc") }
  after_create :send_to_acction_cable

  def self.all_for_user(user)
    Post.where(user_id: user.id).or(Post.where(user_id: user.friend_ids)).or(Post.where(user_id: user.user_ids))
  end

  def user_ids
    self.user.friend_ids + self.user.user_ids
  end

  def self.get_post id
    Post.find(id)
  end

  private
    def send_to_acction_cable
      data = {message: to_html, action:"new_post"}

      self.user.friend_ids.each do |friend_id|
        ActionCable.server.broadcast "posts_#{friend_id}", data
      end

      self.user.user_ids.each do |user_id|
        ActionCable.server.broadcast "posts_#{user_id}", data
      end
    end

    def to_html
      ApplicationController.renderer.render(partial: "posts/post.haml", locals: {post: self})
    end
end
