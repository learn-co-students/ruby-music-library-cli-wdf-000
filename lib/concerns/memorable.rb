module Concerns::Memorable

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      object = self.new(name)
      object.save
      object
    end
  end # ClassMethods end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end # InstanceMethods end

end