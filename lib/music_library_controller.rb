class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    until input == "exit"
      print "Enter command: "
      input = gets.chomp
      case input.downcase
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        artist_songs
      when "list genre"
        genre_songs
      when "exit"
        break
      end
    end
  end
end

# Helper Methods
def list_songs
  Song.all.each.with_index(1) do |song, index|
    puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def list_artists
  Artist.all.each { |artist| puts artist.name }
end

def list_genres
  Genre.all.each { |genre| puts genre.name }
end

def play_song
  track_number = gets.chomp.to_i
  Song.all.each.with_index(1) do |song, index|
    if index == track_number
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end

def artist_songs
  name = gets.chomp
  artist = Artist.find_by_name(name)
  artist.songs.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def genre_songs
  name = gets.chomp
  genre = Genre.find_by_name(name)
  genre.songs.each do |song|
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
