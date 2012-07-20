class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(params[:house])

    if @house.save
      if @house.geo[:lat].blank?
        s = Geocoder.search(@house.address)
        @house.geo = {:lat=>s[0].latitude.to_s,:lng=>s[0].longitude.to_s}
        @house.save
      else
        @house.geo = {:lat=>params[:house][:geo_lat],:lng=>params[:house][:geo_lng]}
        @house.save
      end
      redirect_to @house, notice: 'Successful created new house.'
    else
      render 'new'
    end
  end

  def show
    @house = House.find(params[:id])
  end

  def edit 
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    if @house.update_attributes(params[:house])
      unless (params[:house][:geo_lat].blank?)
        @house.geo = {:lat=>params[:house][:geo_lat],:lng=>params[:house][:geo_lng]}
      end
      @house.save
      redirect_to @house, notice: 'House was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy

    redirect_to houses_url
  end
end