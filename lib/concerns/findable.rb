module Concerns
	module Findable
		def find_or_create_by_name(name)
			tmp = find_by_name(name)
			tmp ||= self.create(name)
			tmp
		end

		def find_by_name(name)
			self.all.detect{|target| target.name == name }
		end

	end
end
