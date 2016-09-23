class BookingsController < ApplicationController
	before_action :set_booking, only: [:show, :edit, :update, :destroy]

	# GET /bookings
	# GET /bookings.json
	def index
		if customer_signed_in?
			@bookings = Booking.where(customer_id: current_customer.id)
		elsif admin_signed_in? || support_agent_signed_in?
			@bookings = Booking.all
		end
	end

	# GET /bookings/1
	# GET /bookings/1.json
	def show
	end

	# GET /bookings/new
	def new
		@booking = Booking.new
	end

	# GET /bookings/1/edit
	def edit
	end

	# POST /bookings
	# POST /bookings.json
	def create
		@booking = current_customer.bookings.build(booking_params)
		@booking = Booking.find_room_availablility(@booking)
		if @booking.room_id.blank?
			flash[:error] = "No bookings available for selected room type"
			render :new
		end
		
		respond_to do |format|
			if @booking.save
				format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
				format.json { render :show, status: :created, location: @booking }
			else
				format.html { render :new }
				format.json { render json: @booking.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /bookings/1
	# PATCH/PUT /bookings/1.json
	def update
		respond_to do |format|
			if @booking.update(booking_params)
				format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
				format.json { render :show, status: :ok, location: @booking }
			else
				format.html { render :edit }
				format.json { render json: @booking.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /bookings/1
	# DELETE /bookings/1.json
	def destroy
		@booking.destroy
		respond_to do |format|
			format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_booking
			@booking = Booking.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def booking_params
			params.require(:booking).permit(:start_date, :end_date,:room_type)
		end
end
