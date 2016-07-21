require 'pry'

class MusicLibraryController

  attr_accessor :path, :imported_music
  #
  def initialize(path = "./db/mp3s")
    @path = path
    @imported_music = MusicImporter.new(@path).import
  end

  def call
    puts "What would you like to do?"
    input = 0
    while input != "exit"
      input = gets.chomp
              # binding.pry
      case input
      when "list songs"
        num = 0
        @imported_music.each { |song| print "#{num += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name} " }
      when "list artists"
        num = 0
        @imported_music.each {|song| puts "#{num += 1}.#{song.artist.name}"}
      when "list genres"
        num = 0
        @imported_music.each {|song| puts "#{num += 1}.#{song.genre.name}"}
      when "list artist"
        puts "Which artist?"
        input = gets.chomp
        # num = 0
        @imported_music.each do |song|
          if song.artist.name == input
            print "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
        # @imported_music.each{|song| if song.artist.name == input print "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list genre"
        puts "What genre?"
        input = gets.chomp
        @imported_music.each do |song|
          if song.genre.name == input
            print "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      when "play song"
        puts "input a number"
        input = gets.chomp
        song = @imported_music[input.to_i - 1]
        print "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

      end
      # binding.pry

    end
  end


end
