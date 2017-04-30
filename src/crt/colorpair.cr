# coding: utf-8
# TODO: Add a cleanup method to free up the slot
module Crt
	class ColorPair
		getter slot
		@@slot_counter = 1_i16
		@slot : Int16
		
		def initialize(foreground : Color, background : Color)
			Crt.init
			@slot = @@slot_counter
			LibNcursesw.init_pair(@slot, foreground, background)
			@@slot_counter += 1
		end

		def value
			return LibNcursesw.color_pair(@slot)
		end
	end
end
