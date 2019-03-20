  class Review < ApplicationRecord
    validates_presence_of :title, :rating, :content, :user_name

    belongs_to :book
  end
