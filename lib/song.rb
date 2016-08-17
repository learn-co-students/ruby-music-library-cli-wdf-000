require_relative "../lib/artist.rb"
require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist.class == Artist
    self.genre = genre if genre.class == Genre


  end

#in my add_song method I had checked if the artist exited per song and if it did then I
#added the song to the artists song collection and so thats why in initialize I check if the
#artist object which I will provide in my CLI is provided with the song object. if it is then I
#pass that object with the artist into the add_song method of the artist lass as a argument. I make
#sure that the artist belongs to the artist class.


  def artist=(artist)
  #This method is the setter for artist. Before this point
    @artist = artist
        #our :artist is not the object for the artist class. We are saying artist
    # artist.songs << self
    artist.add_song(self)  #is nthing until we set it to the object artist. @artist = artist is setting
  end                     #the :artist as the object artist and while it is doing that it is taking a
                          #instance of the song class and adding it to the artists song method!!!
                          #This is important knowlege!!!!!!


  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end


  def self.all
    @@all
  end


  def self.destroy_all #read the spec it tells you its a class method
    all.clear         #since its a class method you have to call the class var
  end

  def save
    @@all << self
  end

  def self.find_by_name(instance)
    self.all.detect do |ins|
      if ins.name == instance
        ins
      end
    end
  end

  def self.find_or_create_by_name(instance)     #this method asks me to notice duplicates. if a song already
    var = self.all.find {|ins| ins.name == instance}  #exists in the array with the given song name
      if var == nil                         # and we said there is a song with that name. we equaled it to a
      self.create(instance)           #variable and said if the variable returns nil meaning it does not exist
      else                        #then we create a new song else we return var whoese return value
        var                   #is the the song object itself. remember the last line in each section will be
      end                       #returned weather its a if else or full method.
  end



  def self.new_from_filename(new_song)
    arr = new_song.split(" - ")
    song = self.create(arr[1])
    song.artist = (Artist.find_or_create_by_name(arr[0]))
    var = arr[2].split(".")
    song.genre = Genre.find_or_create_by_name(var[0])
    song
  end

  #for the self.new_from_filename method you first created a new song instance but before that
  #i split the string new_song into a array and removed the space. I then created a new object
  #for the Song class and I assigned the second element in my arr array as the name of te song.
  #IMPORTANT NOTES:
  #you call on the artist= method for that song and we pass the method find_or_create_by_name
  #for the artist class so that the find or create method checks if that instance exists for artist
  #and if not then it creates a new one. After it creates a new instance or returns an existing artist
  #it lets the song know that this artist is assessible and in the artist= method we added the
  #song to the artist's array for that particular song. Therefore now that our song belongs to an
  #artist, we are able to retrive the artist for the song. REMEMBER YOUR RETURN VALUE!!! song is returned
  #because the test wants the song to be returned.

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  #remember that in the previous method of new_from_filename you are already creating an
  #object and therefore you do not need to initialize a object in this method rather you pass
  #your parameter into the new_from_filename method which will create and parse the method for
  #me and then save the song in the @all array as well as return the song.! duh!







  def self.create(name)
    song = Song.new(name) #remember the return value must be the last line in
    song.save             #the code. When in doubt return the value. text is unclear
    song                  #maybe the objects are always depicted in array's when
  end                 #actually they are just returned. REMEMEBER!





end
