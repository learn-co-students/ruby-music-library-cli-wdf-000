class MusicLibraryController

  attr_reader :path, :musics

  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
    @musics = music_importer.files.sort.collect { |song| song.gsub!(/.mp3/, "") }
  end

  def call

    input = ""

    until input == "exit"
      input = gets.strip

      case input

      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres

      when "play song"
        number = gets.strip.to_i
        self.play_song(number)

      when "list artist"
        artist = gets.strip
        self.song_of_artist(artist)

      when "list genre"
        genre = gets.strip
        self.song_of_genre(genre)
      else

      end
    end
  end

  def list_songs
    count = 1
    self.musics.each { |song|
      puts "#{count}. #{song}"
      count += 1
    }
  end

  def list_artists
    self.musics.each { |song|
      artist = song.split(" - ").first
      puts artist
    }
  end

  def list_genres
    self.musics.each { |song|
      genre = song.split(" - ").last
      puts genre
    }
  end

  def play_song(number)
    song = self.musics[number - 1]
    puts "Playing #{song}"
  end

  def song_of_artist(artist)
    self.musics.each {|song|
      puts song if song.split(" - ").first == artist
    }
  end

  def song_of_genre(genre)
    self.musics.each {|song|
      puts song if song.split(" - ").last == genre
    }
  end

end
