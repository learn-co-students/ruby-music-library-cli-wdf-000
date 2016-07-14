require "pry"

class MusicLibraryController

  def initialize(path = "./db/mp3s")
     MusicImporter.new(path).import
  end

  def call
     looping = true
      while looping do 
        puts "What do you want to do?"
        input = gets.chomp
      
        case input
          when "list songs"
            Song.all.each.with_index(1) {|s, i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
            #binding.pry
          when "list artists"
            Artist.all.each {|s| puts "#{s.name}"}
          when "list genres"  
            Genre.all.each {|s| puts "#{s.name}"}
          when "play song"
           #add if to check <Song.all.count
            puts "Ok, what song number?"
            song_number = gets.chomp
            song = Song.all[song_number.to_i - 1]
            puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}}"

          when "list artist"
            puts "Ok. Enter Artist's name"
            artist_input = gets.chomp
            if artist = Artist.find_by_name(artist_input)
              artist.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
            end

          when "list genre"  
            puts "Ok. Enter Genre"
            genre_input = gets.chomp
            if genre = Genre.find_by_name(genre_input)
              genre.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
            end
          when "exit"
            looping = false
      end
    end
  end
end