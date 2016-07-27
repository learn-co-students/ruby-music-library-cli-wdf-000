class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    @all_array = MusicImporter.new("#{@path}").import 
  end

  def call
    puts "Welcome to the music controller!"
    puts "Please input 'list songs' or 'list artists' or 'list genres' or 'exit'."
    input = gets.chomp

    until input == "exit" do

      if input == "list songs"
        list_songs(Song.all)

      elsif input == "list artists"
        Artist.all.each do |artist|
          puts "#{artist.name}"
        end

      elsif input == "list genres"
        Genre.all.each do |genre|
          puts "#{genre.name}"
        end

      elsif input == "play song"
        #song_number = rand(0..98)
        song = Song.all[0]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        
      elsif Artist.all.detect {|artist| artist.name == input}
        
        artist = Artist.all.detect {|artist| artist.name == input}
          list_songs(artist.songs)

      elsif Genre.all.detect {|genre| genre.name == input}
        genre = Genre.all.detect {|genre| genre.name == input}
          list_songs(genre.songs)
          
      end

      puts "----------------------------------------------------------------------------"
      puts "Please input 'list songs' or 'list artists' or 'list genres' or 'exit'."
      input = gets.chomp  
    end
  end

  def list_songs(all_array)
    count = 1
    all_array.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count = count + 1 
    end
  end

end