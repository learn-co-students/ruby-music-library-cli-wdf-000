require 'bundler'
Bundler.require

module Concerns
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      new_instance = self.new(name)
      new_instance.name = name
      new_instance.save
      new_instance
    end
  end

  #class method
  module Findable
    def find_by_name(name)
      self.all.detect{|x| x.name == name}
    end

    def find_or_create_by_name(name)
      found = self.find_by_name(name)
      
      if found
        found
      else
        new_instance = self.create(name)
        new_instance
      end
    end
  end

  module InstanceMethods
    def save
      if !self.class.all.include?(self) 
        self.class.all << self
      end
    end
  end
end

require_all 'lib'
