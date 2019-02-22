class MapController < ApplicationController
  def index
  end

  def search
  	shops = Shop.includes(:category).near([params[:latitude], params[:longitude]], 3, units: :km)
  	data = shops.map(&:serialize)

  	render json: {data: data}
  end
end
