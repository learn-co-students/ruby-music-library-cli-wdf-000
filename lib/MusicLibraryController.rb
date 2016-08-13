require 'pry'
class MusicLibraryController
  attr_accessor :path, :songs

  def initialize(path_directory="./db/mp3s")
    self.path = path_directory
    new_music = MusicImporter.new(self.path)
    self.songs = new_music.import
  end

  def call
    puts "Welcome to Music library! What would you like to do?"
    input = ""
    until input == "exit"
    input =  gets

    case input
      when "list songs"
        i = 1
        self.songs.each do |song_instance|
          puts "#{i}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
          i += 1
        end
      when "list artists"
        self.songs.each do |song_instance|
          puts "#{song_instance.artist.name}"
        end
      when "list genres"
        self.songs.each do |song_instance|
          puts "#{song_instance.genre.name}"
        end
      when "play song"
        song_number = gets.to_i
        puts "Playing #{self.songs[song_number-1].artist.name} - #{self.songs[song_number-1].name} - #{self.songs[song_number-1].genre.name}"
      when "list artist"
        i = 1
        puts "Please enter the artist's name"
        chosen_artist = gets
        self.songs.each do |song_instance|
          if song_instance.artist.name == chosen_artist
            puts "#{i}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
            i += 1
          end
        end
      when "list genre"
        i = 1
        chosen_genre = gets
        self.songs.each do |song_instance|
          if song_instance.genre.name == chosen_genre
            puts "#{i}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
            i += 1
          end
        end
        "..."
      when "exit"
        "Goodbye!"
      end
    end
  end
end
