module Concerns
  module ClassMethods
    @@all = []

    def all
      @@all
    end
    def destroy_all
      @@all = []
    end

    def create(name)
      self.new(name)
      @@all << [self]
    end
  end
  module InstanceMethods
    extend Concerns::ClassMethods
    def initialize(name)
      @name = name
      @@all << self
    end
    def save
      self.class.all << self
    end     
  end
  module Findable

  end
end
