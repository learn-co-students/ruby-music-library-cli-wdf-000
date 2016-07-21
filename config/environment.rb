require 'bundler'

Bundler.require

module Concerns
  module Findable

    def find_by_name(name)
    self.all.detect{|a| a.name}
    end

  #   def find_or_create_by_name(name)
  #     if !self.all.detect{|song| song.name == name}
  #         Song.new(name).save
  #    else
  #       self.all.detect{|song| song.name == name}
  #    end
   #
  #  end

  def find_or_create_by_name(name)
    if !self.all.detect{|song| song.name == name}
        song = Song.new(name)
        self.all << song
        song
   else
      self.all.detect{|song| song.name == name}
   end

 end

 


  end
end

require_all 'lib'

# require_relative '../lib/concerns/findable'
# require_relative '../lib/artist.rb'
# require_relative '../lib/song.rb'
# require_relative '../lib/genre.rb'
