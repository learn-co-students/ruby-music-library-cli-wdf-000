module Nameable
  module ClassMethods
    def create(name)
      self.new.tap do |o|
        o.name = name
        #i = self.new
        #i.name = name
        #i
      end
    end
  end
end
