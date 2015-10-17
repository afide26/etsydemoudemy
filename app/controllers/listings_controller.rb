class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def seller
    @listings = Listing.where(:user => current_user).order("created_at DESC")
    @user = current_user
  end


  def index
  	@listings = Listing.order("created_at DESC")
  end

  def show
  end

  def new
  	@listing = Listing.new
  end

  def create
  	@listing = Listing.new(listing_params)
    @listing.user = current_user 
  	if @listing.save
  		redirect_to @listing
  		flash[:notice] = "New listing for #{@listing.name} has been created."
  	else
  		render "new"
  	end
  end

  def edit
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
  		@listing.destroy
  		flash[:danger] = "#{@listing.name} has been deleted from the database."
  		redirect_to listings_path
  	end

  	private

  		def listing_params
  			params.require(:listing).permit(:name, :description, :price, :image, )
  		end

      def set_listing
        @listing = Listing.find(params[:id])
      end

      def check_user
        if current_user != @listing.user
          redirect_to  root_url
          flash[:danger] ="Sorry this listing belongs to someone else."
        end
      end
end




