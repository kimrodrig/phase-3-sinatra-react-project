class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  # Add your routes here
  get "/" do
    puts "Welcome to the supermarket API"
  end

  get "/supermarkets" do
    Supermarket.ordered_supermarkets.to_json
  end

  get "/supermarkets/:id" do
    supermarket = Supermarket.find(params[:id])
    supermarket.to_json
  end

  get "/supermarkets/:id/commodities" do
    supermarket = Supermarket.find(params[:id])
    supermarket.commodities.to_json
  end

  get "/supermarkets/:id/comparison" do
    supermarket = Supermarket.find(params[:id])
    supermarket.compare_prices.to_json
  end

  get "/supermarkets/:id/price_index" do
    supermarket = Supermarket.find(params[:id])
    supermarket.price_index.to_json
  end

  get "/supermarkets/:id/areas" do
    supermarket = Supermarket.find(params[:id])
    supermarket.areas.to_json
  end

  get "/areas" do
    Area.all.to_json
  end

  get "/areas/:id" do
    area = Area.find(params[:id])
    area.to_json
  end

  get "/areas/:id/supermarkets" do
    area = Area.find(params[:id])
    area.supermarkets.to_json
  end

  #methods
  get "/supermarkets/byarea/:zipcode" do
    results = Area.search_by_zipcode(params[:zipcode])
    results.to_json
  end

  post "/supermarkets" do
    supermarket = Supermarket.new_supermarket(
      params[:name],
      params[:zipcode],
      params[:price_of_eggs],
      params[:price_of_milk],
      params[:price_of_flour]
    )
    supermarket.to_json
  end

  patch "/supermarkets/:id" do
    supermarket = Supermarket.find(params[:id])
    supermarket.update_prices(
      params[:price_of_eggs],
      params[:price_of_milk],
      params[:price_of_flour]
    )
    supermarket.to_json
  end

  delete "/supermarkets/:id" do
    supermarket = Supermarket.find(params[:id])
    supermarket.delete
    supermarket.to_json
  end

end
