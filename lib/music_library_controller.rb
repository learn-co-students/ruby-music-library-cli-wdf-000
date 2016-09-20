require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.chomp



      if input == "list songs"
        Song.all.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      elsif input == "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}

      elsif input == "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}

      elsif input == "list artist"
        name = gets.chomp
        artist = Artist.find_by_name(name).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      elsif input == "list genre"
        name = gets.chomp
        artist = Genre.find_by_name(name).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      elsif input == "play song"
        input = gets.chomp.to_i
        Song.all.each_with_index do |song, index|
          if input == (index+1)
            puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      end
    end
  end
end
