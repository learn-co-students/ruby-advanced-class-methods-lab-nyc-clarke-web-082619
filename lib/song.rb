class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song_with_name = self.new
    song_with_name.name = name
    song_with_name
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song_name == song.name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      song = self.create_by_name(name)      
    end
    song

  end

  def self.alphabetical
    sorted = self.all.sort_by { |song| song.name }
  end  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    song_split = filename.split(" - ")
    song = self.new
    song.artist_name = song_split[0]
    song.name = song_split[1].delete_suffix(".mp3")
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear 
  end
end
