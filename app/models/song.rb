class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(specific_artist)
    self.artist = Artist.find_or_create_by(name: specific_artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content)
  end

  def note_contents
    self.notes.map
  end
  end
end
