class ListingsController < ApplicationController
  def index
  	@listings = Listing.all
  end

  def show
  	@listing = Listing.find(params[:id])
  end

  def new
  	@listing = Listing.new
  end

  def create
  	@listing = Listing.new(listing_params)
  	if @listing.save
  		redirect_to @listing
  		flash[:notice] = "New listing for #{@listing.name} has been created."
  	else
  		render "new"
  	end
  end

  def edit
  	@listing = Listing.find(params[:id])
  end

  def update
  	@listing = Listing.find(params[:id])
  	if @listing.update(listing_params)
  		redirect_to @listing
  		flash[:notice] = "#{@listing.name} has been updated."
  	else
  		render "edit"
  	end
  end

  	def destroy
  		@listing = Listing.find(params[:id])
  		@listing.destroy
  		flash[:danger] = "#{@listing.name} has been deleted from the database."
  		redirect_to listings_path
  	end

  	private

  		def listing_params
  			params.require(:listing).permit(:name, :description, :price)
  		end
end
