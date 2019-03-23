  class Review < ApplicationRecord
    validates_presence_of :title, :rating, :content, :user_name

    belongs_to :book

    def self.sort_username(username)
      where(user_name: username)
    end

    def self.reviews_by_name(username)
      where(user_name: username).count
    end
  end
