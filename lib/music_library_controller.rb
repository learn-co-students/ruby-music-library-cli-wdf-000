require'pry'

class MusicLibraryController
  attr_accessor :path, :songs

  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
    @songs = music_importer.files.collect {|song| song.gsub(".mp3","")}
  end

  def call
    input = ""

    while input != "exit" 

      puts "Please choose from below"
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "list artist"
      puts "list genre"
      puts "play song"
      input = gets.strip


      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def songs
    @songs.each_with_index {|song,index| puts "#{index+1}. #{song}"}
  end

  def artists
    @songs.each_with_index {|song,index| puts song.split(" - ")[0]}
  end

  def genres
    @songs.each_with_index {|song,index| puts song.split(" - ")[2]}
  end

  def play_song
    puts "Which song would you like to play?"
    song = gets.strip.to_i
    puts "Playing #{@songs[song-1]} "
  end

  def list_artist
    puts "Which artist's songs would you like to play?"
    input = gets.strip
    @songs.each {|song| puts song if song.split(" - ")[0] == input}
   end

  def list_genre
    puts "What kind of genre by name you like to list song for?"
    input = gets.strip
    @songs.each {|song| puts song if song.split(" - ")[2] == input}

  end

end