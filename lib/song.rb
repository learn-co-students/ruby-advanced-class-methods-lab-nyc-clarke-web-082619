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
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    self.all << song
    song
  end

  def self.find_by_name(title)
    @@all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    find = self.find_by_name(title)
    if find
      find
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end


  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(name)
    #class method should not only parse the filename correctly but should also save the song
      song = self.new
      song.name = (name.split(" - ")[1].chomp(".mp3"))
      song.artist_name = (name.split(" - ")[0])
      @@all << song
      song
    end

  def self.destroy_all
    @@all.clear
  end

end
