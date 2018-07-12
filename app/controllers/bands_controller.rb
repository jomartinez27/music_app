class BandsController < ApplicationController

  def index
    render :index
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
