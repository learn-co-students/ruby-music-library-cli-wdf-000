module Concerns::Searchable

  # collects files, splits path and filename, returns only file_name.mp3 collection
  def parse_files(path)
    Dir.glob("#{path}/*").collect do |files|
      files.split("#{path}/").delete_if do |element|
        element == ""
      end
    end.flatten
  end

end # Searchable end