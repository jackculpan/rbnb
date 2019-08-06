class PoolsController < ApplicationController

  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(set_params)
    if @pool.save
      redirect_to pools_path
    else
      render 'new'
  end

  def edit
    @pool = Pool.find(params[:id])
  end

  def update
    @pool = Pool.find(params[:id])
    @restaurant.update(set_params)
    redirect_to pools_path
  end

  private

  def set_params
    params.require(:pool).permit(:name, :location, :price, :number_of_people, :description)
  end
end
