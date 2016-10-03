class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

    # All spots -> city
  def city
    @spots = Spot.all
  end
end
