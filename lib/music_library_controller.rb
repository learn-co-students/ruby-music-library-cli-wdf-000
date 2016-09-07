class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call 
    input = ""
    count = 0

    while input != "exit"
      # puts "Welcome to your Music Library!"
      # puts "What would you like to do?"

      input = gets.strip
      case input

      when "list songs"
        Song.all.each do |song|
          count += 1
          puts "#{count}. #{song.out}"
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