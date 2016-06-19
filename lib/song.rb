class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end
end
