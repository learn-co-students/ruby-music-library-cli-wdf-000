require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def display_songs
    counter = 1
    Song.all.each do |song_obj|
      puts "#{counter}. #{song_obj.artist.name} - #{song_obj.name} - #{song_obj.genre.name}"
      counter += 1
    end
  end

  def display_artist
    array = Song.all.collect do |song_obj|
      song_obj.artist.name
    end.uniq

    array.each do |artist_name|
      puts artist_name
    end
  end

  def display_genre
    array = Song.all.collect do |song_obj|
      song_obj.genre.name
    end.uniq

    array.each do |genre_name|
      puts genre_name
    end
  end

  def call
    puts "Please enter:'list songs', 'list artists', 'list genres', 'play song', 'list artist', 'list genre'  or 'exit' to leave program."
    input = gets.strip

    until input == "exit" do

      if(input == "list songs")
        display_songs

      elsif(input == "list artists")
        Song.all.each do |song_obj|
          puts "#{song_obj.artist.name}"
        end

      elsif(input == "list genres")
        Song.all.each do |song_obj|
          puts "#{song_obj.genre.name}"
        end

      elsif(input == "play song")
        display_songs
        puts "Track # :"
        track = gets.strip

        Song.all.each_with_index do |val, index|
          if(track.to_i == index+1)
            puts "Playing #{val.artist.name} - #{val.name} - #{val.genre.name}"
          end
        end

      elsif(input == "list artist")
        display_artist
        puts "Artist name :"
        artist = gets.strip

        Artist.all.each do |art_obj|
          if(artist == art_obj.name)
            art_obj.songs.each do |song_obj|
              puts "#{song_obj.artist.name} - #{song_obj.name} - #{song_obj.genre.name}"
            end
          end
        end

      elsif(input == "list genre")
        display_genre
        puts "Genre name :"
        genre = gets.strip

        Genre.all.each do |gen_obj|
          if(genre == gen_obj.name)
            gen_obj.songs.each do |song_obj|
              puts "#{song_obj.artist.name} - #{song_obj.name} - #{song_obj.genre.name}"
            end
          end
        end

      end
      
      puts "Please enter:'list songs', 'list artists', 'list genres', 'play song', 'list artist', 'list genre'  or 'exit' to leave program."
      input = gets.strip

    end
  end
end

