module Concerns #cannot be instatiated
  module Findable

    #meta
    #def self.extended(base) # hook to extend :@@all
    #puts "#{base} has been extended by #{self}"
    #Song has been extended by Concerns::Findable
    #base.class_variable_set(:@@all, [])
    #end

    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end
end
