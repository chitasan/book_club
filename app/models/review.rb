  class Review < ApplicationRecord
    validates_presence_of :title, :rating, :content, :user_name

    belongs_to :book

    def self.sort_username(username)
      where(user_name: username)
    end

    def self.reviews_by_name(username)
      where(user_name: username).count
    end

    def self.sort_age(username, order)
      Review.where(user_name: username).order(created_at: order)
    end

    def self.most_reviews(limit)
      select("reviews.user_name, count(reviews.id) AS review_count")
      .group(:user_name)
      .order("review_count DESC")
      .limit(limit)
    end

    def self.still_exists(user)
      if Review.where(user_name: user).count > 0
        true
      else
        false
      end
    end
  end
