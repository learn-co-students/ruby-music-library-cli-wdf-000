require 'bundler'
Bundler.require

module Concerns
  module Findable

    def find_by_name(name)
      all.find{|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
      all.find{|obj| obj.name == name} || self.new(name)
    end
  end
end

require_all 'lib'
