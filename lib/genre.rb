class Genre
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end
end

