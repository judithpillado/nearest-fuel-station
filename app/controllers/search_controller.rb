class SearchController < ApplicationController
  def index
    @station = SearchFacade.fuel_station_search(params[:location])
  end
end
