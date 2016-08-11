require 'bundler'
Bundler.require

module Concerns

	module Findable
		def find_by_name(song_instance)
			self.all.find{|instance| instance.name == song_instance}
		end

		def find_or_create_by_name(instance_name)
			self.find_by_name(instance_name) || self.create(instance_name)
		end
	end


end

require_all 'lib'

