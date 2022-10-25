class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  # Add your routes here
  get "/" do
    puts "Welcome to the supermarket API"
  end

  get "/supermarkets" do
    Supermarket.all.to_json
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

end
