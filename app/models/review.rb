  class Review < ApplicationRecord
    validates_presence_of :title, :rating, :content, :user_name

    belongs_to :book

    def self.sort_username(username)
      Review.where(user_name: username)
    end
  end
