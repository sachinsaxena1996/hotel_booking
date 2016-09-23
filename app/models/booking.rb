class Booking < ApplicationRecord
	belongs_to :customer
	belongs_to :room	
  	validates_date :start_date, :on => :create, :on_or_after => :today
	validates_date :end_date, :on_or_after  => :start_date
	validates_date :end_date, :before => lambda { Date.today + 6.months },
		:before_message => "advance bookings are allowed max upto next 6 months from current date"

	delegate :name, :email, to: :customer, :prefix => true
	delegate :number, to: :room, :prefix => true

	def self.find_room_availablility(booking_ob)
		booked_rooms = Booking.where('(start_date >= ? && end_date <= ?) || (start_date <= ? && end_date >= ?)',
		booking_ob.start_date, booking_ob.end_date,booking_ob.start_date, booking_ob.end_date).pluck(:room_id)
		if booked_rooms.present?
			available_room_id = Room.where.not(id: booked_rooms.uniq).where(room_type: booking_ob.room_type).first.id			
		else
			available_room_id = Room.where(room_type: booking_ob.room_type).first.id
		end
		booking_ob.room_id = available_room_id
		booking_ob.booking_number = booking_ob.assign_rbn(booking_ob.customer.email) if available_room_id.present?
		booking_ob
	end

	def assign_rbn(customer_email)
		"RBN"+ customer_email[0..1].upcase + rand(100000000).to_s
	end
end
