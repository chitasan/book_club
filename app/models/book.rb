class Book < ApplicationRecord
  validates_presence_of :title, :pages, :pub_date
end
