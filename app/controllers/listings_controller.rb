class ListingsController < ApplicationController


	def index
		@listings = Listing.all
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@Listing = Listing.new
	end

	def create
		@Listing = Listing.new(listing_params)
		if @Listing.save
			redirect_to @listing
			flash[:notice] = "New listing for #{@listing.name} has been created"
		else
			render "new"
		end
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
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
		redirect_to root_url
		flash[:notice] = "The listing for #{@listing.name} has been deleted."
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :description, :price)
	end

end
