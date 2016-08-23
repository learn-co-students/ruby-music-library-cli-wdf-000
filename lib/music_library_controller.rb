require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    counter = 0
    while (input != "exit")
      input = gets.strip
       case input
       when "list songs"
        #  to lookup: #each_with_index method
         Song.all.each do |song|
           counter += 1
           puts "#{counter}. #{song.out}"
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
          # play_song = gets.strip.to_i - 1
          Song.all.each do |song|
            puts "Playing #{song.out}"
          end

      when "list artist"
        Song.all.each do |artist|
          puts "#{artist.out}"
        end

      when "list genre"
        Song.all.each do |genre|
          puts "#{genre.out}"
        end

      end
    end
  end
end
