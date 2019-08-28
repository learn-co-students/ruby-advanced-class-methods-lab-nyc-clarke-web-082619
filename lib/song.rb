class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ||self.create_by_name(song_name) 
  end

  def self.alphabetical 
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(string)
    data = string.split(" - ")
    new_song = Song.new
    new_song.name = data[1].split(".")[0]
    new_song.artist_name =data[0]
    new_song
  end

  def self.create_from_filename(string)
    data = string.split(" - ")
    new_song = Song.create_by_name(data[1].split(".")[0])
    new_song.artist_name =data[0]
    new_song
  end

  def self.destroy_all
    @@all = []
  end



end
