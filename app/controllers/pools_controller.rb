class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @pools = params[:query] ? search : Pool.geocoded
    @markers = @pools.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude
      }
    end
  end

  def show
    @pool = Pool.find(params[:id])
    @reviews = @pool.reviews
    @booking = Booking.new
    authorize @pool
    @markers = { lat: @pool.latitude, lng: @pool.longitude }
  end

  def new
    @pool = Pool.new
    authorize @pool
  end

  def create
    @pool = Pool.new(set_params)
    @pool.user = current_user
    authorize @pool
    if @pool.save
      redirect_to pools_path
    else
      render 'new'
    end
  end

  def edit
    @pool = Pool.find(params[:id])
    authorize @pool
  end

  def update
    @pool = Pool.find(params[:id])
    authorize @pool
    @pool.update(set_params)
    redirect_to pools_path
  end

  def destroy
    @pool = Pool.find(params[:id])
    authorize @pool
    @pool.destroy
    redirect_to dashboard_users_path
  end

  def search
    Pool.where("name ILIKE '%#{params[:query].first.capitalize}%'")
  end

  private

  def set_params
    params.require(:pool).permit(:name, :location, :price, :number_of_people, :description, :photo)
  end
end
