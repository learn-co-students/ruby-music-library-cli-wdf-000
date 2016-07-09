require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome Music Library"
    puts "Please enter song name"
    input = ""
    until input ==  "exit"
      input = gets.chomp
      if input == "list songs"
        
        Song.all.each.with_index(1) do |s, index|
          puts "#{index}. " + s.artist.name + " - " + s.name.to_s + " - " + s.genre.name.to_s
        end
      
      elsif input == "list artists"
        Song.all.each { |song| puts song.artist.name }
      
      elsif input == "list genres"
        Song.all.each { |song| puts song.genre.name } 

      elsif input == "play song"
        number = gets.chomp.to_i
        file = Song.all[number -1]
        puts "Playing " + file.artist.name + " - " + file.name + " - " + file.genre.name

      elsif input == "list artist"
        artist_name = gets.chomp
        artist_instance = Song.all.detect {|song| song.artist.name == artist_name }.artist

        artist_instance.songs.each do |song|
          puts song.artist.name +  " - " + song.name + " - " + song.genre.name 
        end
      elsif input == "list genre"
        genre_name = gets.chomp
        genre_instance = Song.all.detect {|song| song.genre.name == genre_name }.genre

        genre_instance.songs.each do |song|
          puts song.artist.name +  " - " + song.name + " - " + song.genre.name 
        end
          
      end
    end
  end
end
