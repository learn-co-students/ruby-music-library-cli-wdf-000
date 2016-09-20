module Persistance
  module InstanceMethods
    def save # Instance method
      self.class.all << self
    end
  end

  module ClassMethods

    def reset_all #Class method
      self.clear
    end

    #meta
    #def self.extended(base) # hook to extend :@@all
      #puts "#{base} has been extended by #{self}"
      #Song has been extended by Concerns::Findable
      #base.class_variable_set(:@@all, [])
      #end
  end
end
