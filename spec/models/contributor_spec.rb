require 'rails_helper'

RSpec.describe Contributor do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :github}
  end
end
