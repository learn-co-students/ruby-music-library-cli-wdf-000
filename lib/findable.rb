module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|object| object.name == name}
    end

    def find_or_create_by_name(name)
      if !self.find_by_name(name)
        new_instance = self.new(name)
      else
        self.find_by_name(name)
      end
    end
  end
end