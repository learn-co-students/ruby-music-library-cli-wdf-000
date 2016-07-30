class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_importer = MusicImporter.new(path)
    new_importer.import
  end

  def call
    puts "Welcome to your music library!"
    menu = "Please enter 'list artists', 'list genres',  or 'list songs' to see a list of all artists, genres, or songs. Enter 'list artist' or 'list genre' to list songs by one artist or in one genre. Enter 'play song' to listen to a song. Type 'exit' to leave:"
    prompt = "What would you like to do? Type 'menu' to see options:"
    input = " "
    puts menu

    until input == "exit"
      puts prompt
      input = gets.chomp
      
      if input == "menu"
        puts menu
      end

      if input == "list artists"
        artists
      end
      
      if input == "list genres"
        genres
      end
      
      if input == "list songs"
        songs
      end
      
      if input == "play song"
        play_song
      end
      
      if input == "list artist"
        list_artist
      end
      
      if input == "list genre"
        list_genre
      end
    end
  end

end

  def artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def songs
    Song.all.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def play_song
    songs
    puts "Please select a song by number:"
    song_choice = gets.chomp.to_i - 1
    puts "Playing #{Song.all[song_choice].artist.name} - #{Song.all[song_choice].name} - #{Song.all[song_choice].genre.name}"
  end

  def list_artist
    puts "Please enter an artist's name:"
    artist_choice = gets.chomp
    Artist.all.each do |artist|
      if artist_choice == artist.name
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_genre
    puts "Please enter the name of a genre:"
    genre_choice = gets.chomp
    Genre.all.each do |genre|
      if genre_choice == genre.name
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

