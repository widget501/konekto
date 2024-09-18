class SearchController < ApplicationController
  def index
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @results = []
    end
  end
end
