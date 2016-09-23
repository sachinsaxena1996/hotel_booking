module API
	module V1
		class Bookings < Grape::API
			prefix  'api'
			version 'v1',using: :accept_version_header
			resource :bookings do
				desc "Return all available room numbers for booking date and room_type"
				get '/available_bookings' do
					booked_rooms = Booking.where('(start_date >= ? && end_date <= ?) || (start_date <= ? && end_date >= ?)',
					params[:start_date], params[:end_date], params[:start_date], params[:end_date]).pluck(:room_id)
					if booked_rooms.present?
						if params[:room_type].present?
							available_room_numbers = Room.where.not(id: booked_rooms.uniq).where(room_type: params[:room_type])
							pluck(:number)
						else
							available_room_numbers = Room.where.not(id: booked_rooms.uniq).pluck(:number)
						end
					else
						if params[:room_type].present?
							available_room_numbers = Room.where(room_type: params[:room_type]).pluck(:number)
						else
							available_room_numbers = Room.pluck(:number)
						end
					end
					if available_room_numbers.present?
						 available_room_numbers
					else
						if params[:room_type].present?
							["No #{params[:room_type]} rooms available for Start Date: #{params[:start_date]} and
							End Date: #{params[:end_date]}"].as_json
						else
							["No rooms available for Start Date: #{params[:start_date]} and
							End Date: #{params[:end_date]}"].as_json
						end
					end
				end
			end
		end
	end
end
	

