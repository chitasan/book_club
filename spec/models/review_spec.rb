require 'rails_helper'

RSpec.describe Review do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :content}
    it {should validate_presence_of :user_name}
  end

  describe "relationships" do
    it {should belong_to :book}
  end
end
