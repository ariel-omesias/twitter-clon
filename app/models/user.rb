class User < ApplicationRecord

  before_destroy :delete_friends
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, :through => :likes, :source => :tweet
  
  has_many :friends, dependent: :destroy

  def delete_friends
    Friend.where(:friend_id => id).destroy_all
  end

  def is_following?(friend_id)
    friends.where(:friend_id => friend_id).exists?
  end

  def arr_friends_id
    friends.map(&:friend_id).push(id)
  end

  def friends_count
    friends.count
  end

  def tweets_count
    tweets.count
  end

  def likes_give_it
    likes.count
  end

  def retweet_give_it
    tweets.where.not(rt_ref: nil).count
  end
end
