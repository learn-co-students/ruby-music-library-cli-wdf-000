require 'bundler'
Bundler.require

module Concerns

  module Memorable
    module ClassMethods
      def destroy_all
        self.all.clear
      end

      def create(name)
        object = self.new(name)
        object.save
        object
      end
    end # ClassMethods end
    module InstanceMethods
      def save
        self.class.all << self
      end
    end # InstanceMethods end
  end # Memorable end

  module Findable
    def find_by_name(name)
      self.all.find {|object| object.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end # Findable end

  module Searchable
    # collects files, splits path and filename, returns only file_name.mp3 collection
    def parse_files(path)
      Dir.glob("#{path}/*").collect do |files|
        files.split("#{path}/").delete_if do |element|
          element == ""
        end
      end.flatten
    end
  end # Searchable end

  module Paramable
    def normalize_song_name(song)
      "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end # Paramable end

end # Concerns end

require_all 'lib'
