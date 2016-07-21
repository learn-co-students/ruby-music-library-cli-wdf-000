
class MusicLibraryController


  def initialize(path = './db/mp3s' )
    @path = path
    MusicImporter.new(path).import
  end

  def call
    # puts "Enter input (or exit)"
    ip = ""
    until (ip == "exit")
      ip = gets.chomp

      if ip == "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      elsif ip == "list artists"
        Artist.all.each do |artist|
          puts "#{artist.name}"
        end
      elsif ip == "list genres"
        Genre.all.each do |genre|
          puts "#{genre.name}"
        end
      elsif ip == "play song"
        number = gets.chomp
        song =  Song.all[number.to_i - 1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      elsif ip == "list artist"
        a = gets.chomp
        Song.all.each do |song|
          if song.artist.name == a
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      elsif ip == "list genre"
        g = gets.chomp
        Song.all.each do |song|
          if song.genre.name == g
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end

        end


      end
    end
  end
end
