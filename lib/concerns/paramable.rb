module Concerns::Paramable

  def normalize_song_name(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

end