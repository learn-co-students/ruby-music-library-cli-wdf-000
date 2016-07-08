class MusicLibraryController
  def initialize(path='./db/mp3s') 
    @imported = MusicImporter.new(path).import
  end
  def call
    loop do
      puts "Enter input"
      input = gets.chomp
      break if input == "exit"
      if input == "list songs"
	list_songs
      elsif input == "list artists"
	list_artists
      elsif input == "list genres"
	list_genres
      elsif input == "play song"	
	list_songs
	selection = gets.chomp.to_i - 1
	puts "Playing #{@imported[selection].artist.name} - #{@imported[selection].name} - #{@imported[selection].genre.name}"
      elsif input == "list artist"
	list_artists_songs
      elsif input == "list genre"
	list_genres_songs
      end
    end
  end
  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end
  def list_songs
    Song.all.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end
  def list_artists_songs
    puts "What artist name do you want to search?"
    name = gets.chomp
    artist = Artist.find_by_name(name).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  def list_genres_songs
    puts "What genre are you searching for?"
    name = gets.chomp
    Genre.find_by_name(name).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end
