require 'pry'
class MusicLibraryController
  attr_accessor :path, :imported_music
  def initialize(path = "./db/mp3s")
    @path = path
    @imported_music = MusicImporter.new(@path).import
  end

  def list_options
    puts "Choose from the following options:"
    puts "'exit' - exits the program"
    puts "'list songs' - lists all the available songs"
    puts "'list artists' - lists all the available artists"
    puts "'list genres' - lists all the available genres"
    puts "'play song' - choose a song to play"
    puts "'list artist' - lists all the available songs by the artist"
    puts "'list genre' - lists all the available songs in the genre"
    puts "'help' or anything else - show this menu"
  end

  def format_song_data(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_song_data(array_of_songs)
    array_of_songs.each {|song| puts format_song_data(song) }
  end

  def call
    input = ""
    list_options
    loop do
      puts ":"
      input = gets.chomp
      if input == "exit"
        break
      end
      case input
      when "list songs"
        i = 1
        @imported_music.each do |song|
          puts "#{i}. #{format_song_data(song)}"
          i+=1
        end
      when "list artists"
        puts @imported_music.collect{|song| song.artist.name}.uniq
      when "list genres"
        puts @imported_music.collect {|song| song.genre.name}.uniq

        ##All these data validity checks should be done in a neater fashion... maybe raise error and rescue?
      when "play song"
        puts "Please enter a song number:"
        number = gets.chomp.to_i
    #    if number >= 1 && number <= @imported_music.size ##let's check for data validity
          puts "Playing #{format_song_data(@imported_music[number - 1])}"
    #    else
    #      puts "Invalid choice. There are only #{@imported_music.size} songs in the library."
    #    end
      when "list artist"
        puts "Please enter artist name"
        artist_name = gets.chomp
        if !Artist.find_by_name(artist_name).nil? ##let's check for data validity
          list_song_data(@imported_music.select{|song| song.artist.name == artist_name})
       else
          puts "Invalid choice. There are no songs by #{artist_name} in the library."
        end
      when "list genre"
        puts "Please enter genre"
        genre_type = gets.chomp
        if !Genre.find_by_name(genre_type).nil?  ##let's check for data validity
          list_song_data(@imported_music.select{|song| song.genre.name == genre_type})
        else
          puts "Invalid choice. There are no #{genre_type} songs in the library."
        end
      else
        list_options
      end

    end
  end
end
