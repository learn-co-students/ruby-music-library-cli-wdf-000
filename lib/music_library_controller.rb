
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    # @path = path
    bruh = MusicImporter.new(path)
    bruh.import
  end

  def call

    status = false
    until status == true
    input = gets.strip

    case input

    when "list songs"
      Song.all.each_with_index do |file, i|
        puts "#{i+1}. #{file.artist.name} - #{file.name} - #{file.genre.name}"
      end

    when "list artists"
      Artist.all.each do |artist|
        puts "#{artist.name}"
      end
  
    when "list genres"
      Genre.all.each do |genre|
        puts "#{genre.name}"
      end
    
    when "play song"
      track = gets.to_i 
      # puts track
      x = track - 1
      ayo = Song.all[x]
      puts "Playing #{ayo.artist.name} - #{ayo.name} - #{ayo.genre.name}"
    
    when "list artist"
      artist = gets.strip
      bruh = Artist.find_by_name(artist)
      bruh.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

    when "list genre"
      genre = gets.strip
      bruh = Genre.find_by_name(genre)
      bruh.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end


    when "exit"
      status = true
  end

  end
end


end