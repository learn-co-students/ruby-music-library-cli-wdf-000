class MusicLibraryController
  attr_reader :path

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Music Library"
    puts "Please enter a command (type 'help' to list commands):"
    input = nil
    while input != 'exit'
      input = gets.strip.downcase
      case input
      when /^help/
        puts "You can type 'list' followed by 'songs', 'artists', or 'genres'."
        puts "Type 'list artist' followed by ARTIST-NAME by a specific artist's songs."
        puts "Type 'list genre' followed by GENRE-NAME of a specific genre."
        puts "Type 'play song' followed by SONG-NUMBER to play it."
        puts "Type 'help' to see this message."
        puts "Type 'exit' to exit." 

      when /^list songs\b/
        Song.all.each.with_index(1){|song, i| puts "#{i}. " + song.artist.name + " - " + song.name + " - " + song.genre.name}

      when /^list artists\b/
        Artist.all.each.with_index(1){|artist| puts artist.name}

      when /^list genres\b/
        Genre.all.each.with_index(1){|genre| puts genre.name}

      when /^list\s+artist\b/
        puts "\nPlease enter artist name: "
        artist_name = gets.strip
        artist = Artist.find_by_name(artist_name)
        if artist == nil
          puts "\nCould not find #{artist_name} in the library."
        else
          artist.songs.each{|song| puts song.artist.name + " - " + song.name + " - " + song.genre.name}
        end

      when /^list\s+genre+\b/
        puts "\nPlease enter genre: "
        genre_name = gets.strip
        genre = Genre.find_by_name(genre_name)
        if genre == nil
          puts "\nCould not find #{genre_name} in the library."
        else
          genre.songs.each{|song| puts song.artist.name + " - " + song.name + " - " + song.genre.name}
        end

      when /^play\s+song\b/
        puts "\nPlease enter song number: "
        song_number = gets.strip.to_i
        if song_number == 0 || song_number > Song.all.length
          puts "\nCould not find song #{song_number} in the library."
        else
          song = Song.all[song_number - 1]
          str = song.artist.name + " - " + song.name + " - " + song.genre.name
          puts "\nPlaying #{str}."
        end

      else
        puts "Unknown command. Type 'help' for help."
      end
      
      puts "\n Please enter command:"
    end
    
    puts "\nGoodbye."
  end
end
