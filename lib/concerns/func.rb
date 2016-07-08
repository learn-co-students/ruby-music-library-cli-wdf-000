module Func

	module ClassMethods

		def destroy_all
			self.all.clear
		end
		def create(name)
			tmp = self.new(name)
			tmp.save
			tmp
		end
	end

	module InstanceMethods
		def save
			self.class.all << self
		end
	end

end
