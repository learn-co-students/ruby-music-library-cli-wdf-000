class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = nil
    until input == "exit"
      puts "Welcome to your Music Library. What would you like to do?"
      input = gets.chomp
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_songs
      when "list artist"
        list_the_artist
      when "list genre"
        list_the_genre
      end
    end
  end

  def list_songs
    Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_songs
    input = gets.chomp.to_i
    Song.all.each_with_index do |song, index|
      if input == (index + 1)
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_the_artist
    artist = gets.chomp
    Song.all.each do |song|
      if artist == song.artist.name
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_the_genre
    genre = gets.chomp
    Song.all.each do |song|
      if genre == song.genre.name
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end