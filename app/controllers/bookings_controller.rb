class BookingsController < ApplicationController
  
  def new
    @flight = Flight.find(params[:flight_id])  
    @booking = @flight.bookings.build
    params[:passengers].to_i.times do
      @booking.passengers.build      
    end
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      flash.now[:error] = "All fields are required."
      render :new
    end
  end
  
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  private
  
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
    
end