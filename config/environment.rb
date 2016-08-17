require 'bundler'
Bundler.require


module Concerns

  module Findable


    def find_by_name(instance)             #remember these are class methods you do not have to call self. It
      all.detect do |ins|    #will be called on the class. You contain all your class and instance
        if ins.name == instance  #moduels in a larger module. You can then call a class module by extend
          ins               #for class then the module and then the inner moduel for instance
        end                       #extend Concerns::Findable and if it was instance methods with include
      end                          #name::name
    end


    def find_or_create_by_name(instance)     #this method asks me to notice duplicates. if a song already
      var = all.find {|ins| ins.name == instance}  #exists in the array with the given song name
        if var == nil                         # and we said there is a song with that name. we equaled it to a
        create(instance)           #variable and said if the variable returns nil meaning it does not exist
        else                        #then we create a new song else we return var whoese return value
          var                   #is the the song object itself. remember the last line in each section will be
        end                       #returned weather its a if else or full method.
    end

  end


require_all 'lib'      #require_all gem is in the bottom of your code because remember ruby reads
                    #everything from top to bottom. Concerns is called in the lib files. Since
                    #require_all gem was before the module Concerns and Class module Findable, ruby was
                    #unable to identify concerns::findable in lib. :)

end
