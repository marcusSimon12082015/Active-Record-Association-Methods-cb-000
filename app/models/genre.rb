class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.size
  end

  def artist_count
    # return the number of artists associated with the genre
    self.songs.count(:artist_id)
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    artist_ids = []
    self.songs.each do |s|
      artist_ids << s.artist_id
    end.uniq
    Artist.where(id:artist_ids).pluck(:name)
  end
end
