class Contributor < ApplicationRecord
  validates_presence_of :name, :github
end
