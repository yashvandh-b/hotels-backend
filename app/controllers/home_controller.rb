class HomeController < ApplicationController
  def index
  end

  def about
    @about = "We provide platforms to surf through the list of hotels from various locations. "
  end
end
