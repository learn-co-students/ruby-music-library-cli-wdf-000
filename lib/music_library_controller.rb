class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.chomp
      
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

  private
  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def play_song
    puts "what song number would you like to play?"
    input = gets.chomp

    if (1..Song.all.count).include?(input.to_i)
      song = Song.all[input.to_i - 1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    elsif input == "exit"
      return
    else
      puts "Invalid number. Try again."
      play_song
    end
  end

  def list_artist
    puts "Which artist by name would you like to list song for?"
    input = gets.chomp
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.each.with_index do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    elsif input == "exit"
      return
    else
      puts "Invalid name. Try again."
      list_artist
    end
  end

  def list_genre
    puts "Which genre by name would you like to list song for?"
    input = gets.chomp
    if Genre.find_by_name(input)
      Genre.find_by_name(input).songs.each.with_index do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    elsif input == "exit"
      return
    else
      puts "Invalid genre. Try again."
      list_genre
    end
  end
end
