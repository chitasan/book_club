class HomeController < ApplicationController
  def welcome
    @contributors = Contributor.all
  end
end
