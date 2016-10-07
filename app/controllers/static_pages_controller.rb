class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

    # All spots -> city
  def city
    @spots = Spot.all
    if params[:search]
      @spots = Spot.search(params[:search]).order("created_at DESC")
    else
      @spots = Spot.all.order('created_at DESC')
    end
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow "<p>Spot title: #{spot.title}</p> <p>Address: #{spot.address}</p> <p>More info: #{spot.description}</p> <p>Time Limit: #{spot.time_limit}</p>"
      marker.picture({
                          "url": "http://i.imgur.com/HmtmMSt.png",
                          "width":  50,
                          "height": 50
                    })
    end
  end
end
