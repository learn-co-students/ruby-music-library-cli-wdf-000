module Concerns
  
  module Findable
    def find_by_name(name)
      self.all.detect do |song|
        song.name == name
      end
    end

    def find_or_create_by_name(name)
      # binding.pry
      self.find_by_name(name) || self.create(name)
    end

  end

  # module Makeable
    
  #   module ClassMethods
  #     def destroy_all
  #       self.all.clear
  #     end

  #     def create(name)
  #       created = self.new(name)
  #       created.save
  #       created
  #     end
      

  #   end

  # end

end