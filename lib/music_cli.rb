require 'pry'
class MusicLibraryController

attr_accessor :path

def initialize(path ='./db/mp3s')
  @path = path
  MusicImporter.new(@path).import
end

def call
  active = true
  while active == true
    welcome = "Welcome to the music controller! Please input 'list ___' or 'exit'."
    response = gets.chomp
    if response == "exit"
      active = false
    else
      input_tree(response)
    end
  end
end

def input_tree(response)
    if response == ("list songs")
      list_songs(Song.all)
    elsif response == ("list artists")
      Artist.all.each {|artist| puts "#{artist.name}"}
    elsif response == "list genres"
      Genre.all.each {|genre| puts "#{genre.name}"}
    elsif response == "play song"
      song_number = (gets.chomp.to_i) - 1
      song = Song.all[song_number]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    elsif Artist.all.detect {|artist| artist.name == response}
      artist = Artist.all.detect {|artist| artist.name == response}
      list_songs(artist.songs)
    elsif Genre.all.detect {|genre| genre.name == response}
      genre = Genre.all.detect {|genre| genre.name == response}
      list_songs(genre.songs)
    end
end

def list_songs(all_array)
  i = 1
  all_array.each do |song|
    puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    i += 1
  end
end

end
