require 'pry'

class Person

  attr_accessor :name

  extend Findable

  # def initialize(name)
  #   @name = name
  # end

  def self.create(name)
    Person.new(name)
    # new_person
    binding.pry
  end




end