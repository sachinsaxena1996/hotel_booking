module RoomsHelper
	def options_for_room_type
		options_for_select([["Deluxe Rooms", "Deluxe Rooms"], ["Luxury Rooms", "Luxury Rooms"], ["Luxury Suites", "Luxury Suites"],
		 ["Presidential Suites", "Presidential Suites"]])
	end

	def options_for_spec
		options_for_select([["Queen Size Bed", "Queen Size Bed"],
		 ["Queen Size Bed and Pool Facing", "Queen Size Bed and Pool Facing"],
		 ["King Size Bed and Pool Facing", "King Size Bed and Pool Facing"],
		 ["King Size Bed, Pool Facing with a Gym", "King Size Bed, Pool Facing with a Gym"]])
	end

	def options_for_status
		options_for_select([["Available", "Available"],
		 ["Booked", "Booked"]])
	end
end

