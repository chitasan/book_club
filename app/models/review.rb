  class Review < ApplicationRecord
    validates_presence_of :title, :rating, :content, :user_name

    belongs_to :book

    def self.sort_username(username)
      Review.where(user_name: username)
    end

    def reviews_by_name
      Review.where(user_name: self.user_name).count
    end
  end
