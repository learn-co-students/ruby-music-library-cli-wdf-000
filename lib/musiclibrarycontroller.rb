require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
  @path = path
  MusicImporter.new(path).import
  end


  def call
    puts "Please enter 'list artists' to list artists, 'list genres' to list genres,'list songs' to list songs, 'play song' to play a song and 'exit' to exit!"
    input = gets.strip
    until input == "exit" do

      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list artist"
        list_artists
         puts "please enter the artist name to list the artist songs"
         new_input = gets.strip
         artist_songs(new_input)
      elsif input == "list genres"
        list_genres
      elsif input == "list genre"
        list_genres
        puts "please enter the name of genre name in order to see a list of songs with that genre"
        another_input = gets.strip
        song_genre(another_input)
      elsif input == "play song"
        puts "Enter the number of the song you want to play"
        new_input = gets.strip
        play_song(new_input)
      end
      puts "Please enter 'list artists' to list artists, 'list genres' to list genres,'list songs' to list songs, 'play song' to play a song and 'exit' to exit!"
      input = gets.strip
    end #end of until
  end #end o


  def list_songs
      Song.all.each_with_index do |each_song, i|
        puts "#{i + 1}. #{each_song.artist.name} - #{each_song.name} - #{each_song.genre.name}"
    end
  end


  def list_artists
    artist = Artist.all
    artist.each_with_index do |each_artist, i|
      puts "#{i + 1}. #{each_artist.name}"
    end
  end

  def list_genres
    genre = Genre.all
    genre.each_with_index do |each_genre, i|
      puts "#{i + 1}. #{each_genre.name}"
    end
  end

  def play_song(new_input)
    Song.all.each.with_index(1) do |each_song, i|
      if new_input.to_i == i
      puts "Playing #{each_song.artist.name} - #{each_song.name} - #{each_song.genre.name}"
      end
    end
  end

  def artist_songs(new_input)

     Artist.all.each do |each_artist|
       if new_input == each_artist.name
          each_artist.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      end
    end

  def song_genre(bibi)
    Genre.all.each do |each_genre|
      if bibi == each_genre.name
         each_genre.songs.each do |song|
           puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
         end
       end
     end

  end




end
