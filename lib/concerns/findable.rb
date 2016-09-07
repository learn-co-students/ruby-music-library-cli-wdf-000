module Concerns
  module Findable
  # module ClassMethods

    def find_by_name(name)
      self.all.detect{|song| song.name == name}
    end

    def new_by_name(name)
      song = self.new(name)
    end

    def create_by_name(name)
      song = self.new_by_name(name)
      song.save
      song
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
    end

  end
end

