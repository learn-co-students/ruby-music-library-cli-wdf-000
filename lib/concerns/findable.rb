module Concerns
  # Class Methods
  module Findable
    # no need for 'self' because using 'extend' in the class definition
    # lets the class know what follows are class methods.
    def find_by_name(name)
      self.all.find { |object| object.name == name }
    end

    def find_or_create_by_name(name)
      if self.all.any? { |object| object.name == name }
        self.find_by_name(name)
      else
        self.create(name)
      end
    end
  end
end
