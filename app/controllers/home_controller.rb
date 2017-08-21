class HomeController < ApplicationController
before_action :authenticate_user!
  def home
  	@customers= Customer.includes(:addresses).all
    @addres = Address.all

    @map_hash = Gmaps4rails.build_markers(@addres) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow [address.address,"</br>", address.latitude,address.latitude].join('-')
    end
  end
end
