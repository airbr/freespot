class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

    # All spots -> city
  def city
    @spots = Spot.all
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow spot.description
    end
  end
end
