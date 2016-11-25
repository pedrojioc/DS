# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string           default(""), not null
#  name                   :string           not null
#  bio                    :string
#  uid                    :string
#  provider               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  cover_file_name        :string
#  cover_content_type     :string
#  cover_file_size        :integer
#  cover_updated_at       :datetime
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  validates :username, presence: true, uniqueness: true, length: {in: 3..12}
  validate :validate_username_regex
  #Relación => Tiene muchos posts
  has_many :posts
  has_many :likes
  has_many :friendships
  has_many :followers, class_name: "Friendship", foreign_key: "friend_id"

  has_many :friends_added, through: :friendships, source: :friend
  has_many :friends_who_added, through: :friendships, source: :user
  has_many :comments

  has_attached_file :avatar, styles: {thumb: "100x100", medium:"300x300"}, default_url:"/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :cover, styles: {thumb: "400x300", medium:"800x600"}, default_url:"/images/:style/missing_cover.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def friend_ids
    #Yo envie la amistad
    #Yo soy el user_id => friend_id
    Friendship.active.where(user:self).pluck(:friend_id)
  end

  def user_ids
    #Me enviaron la amistad
    #Yo soy el friend_id => user_id
    Friendship.active.where(friend:self).pluck(:user_id)
  end

  def unviewed_notifications_count
    Notification.for_user(self.id)
  end

  def self.from_omniauth(auth)

  	where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
  		if auth[:info]
        user.email = auth[:info][:email]
  			user.name = auth[:info][:name]
  		end
  		user.password = Devise.friendly_token[0,20]
  	end
  end

  def my_friend?(friend)
    Friendship.friends?(self, friend)
  end

  #Consulta las amistades de una persona y obtiene los datos de las amistades
  def self.friends(user)
    #Consulto las amistades del usuario enviado
		friendships = Friendship.friendships_of_a_user(user)
    #Creo un array para guardar los usuarios
    friends = []
    #Itero la variable
		friendships.each do |friendship|
			if friendship.user_id == user.id
				friends.push(User.find(friendship.friend_id))
			else
				friends.push(User.find(friendship.user_id))
			end
		end
    #Devuelvo el array con los usuarios
    friends
	end

  #Devuelve una sugerencia de las personas buscadas (PUEDE QUE ESTE NO SEA SU LUGAR)
  def self.terms_for(term)
    Rails.cache.fetch(["search-terms", name]) do
      #where("name like ?", "#{name}%").limit(10).pluck(:name)
      where("LOWER(name) LIKE :term ", term: "#{term.downcase}%").limit(10)
    end
  end

  def self.count_likes_for_user(user_id)
    Like.joins("INNER JOIN posts ON posts.id = item_id").where("posts.user_id = #{user_id}").count
  end

  private
  def validate_username_regex
    unless username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9_]*\z/
       errors.add(:username, "El nombre du usuario debe iniciar con una letra y puede contener guines bajos o numeros")
    end
  end
end
