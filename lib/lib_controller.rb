require 'pry'
class MusicLibraryController
  extend Concerns::Findable
  include Concerns::Searchable
  include Concerns::Paramable
  attr_accessor :path, :music_importer
  attr_reader :call

  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  # Refactor this again?
  def call
    input = ""
    until input == "exit"
      case input = gets.chomp
      when "list songs"
        Song.all.map.with_index do |song, index|
          puts "#{index + 1}. #{normalize_song_name(song)}"
        end
      when "list artists"
        Artist.all.each {|artist| puts "#{artist.name}" }
      when "list genres"
        Genre.all.each {|genre| puts "#{genre.name}" }
      when "play song"
        song_num = gets.chomp.to_i
        song = Song.all[song_num - 1]
        puts "Playing " + normalize_song_name(song)
      when "list artist" # list all songs beloning to artist
        artist_name = gets.chomp
        artist_songs = Artist.all.find do |artist|
          artist.songs if artist.name == artist_name
          # chaining by going into artists songs
        end.songs.each {|song| puts normalize_song_name(song) }
      when "list genre" # list all songs beloning to genre
        genre_name = gets.chomp
        genre_songs = Genre.all.find do |genre|
          genre.songs if genre.name == genre_name
          # chaining by going into genres songs
        end.songs.each {|song| puts normalize_song_name(song) }
      end
    end
  end

end