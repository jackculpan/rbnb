class PoolsController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
    authorize @pool
  end

  def new
    @pool = Pool.new
    authorize @pool
  end

  def create
    @pool = Pool.new(set_params)
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
    @restaurant.update(set_params)
    redirect_to pools_path
  end

  private

  def set_params
    params.require(:pool).permit(:name, :location, :price, :number_of_people, :description)
  end
end
