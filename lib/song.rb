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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.new_by_name(title)
    song.save
    song
  end

  def self.find_by_name(title)
    @@all.find{|x| x.name == title}
  end

  def self.find_or_create_by_name(title)
    song = Song.find_by_name(title)
    if song
      return song
    else
      Song.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(/-/)
    puts arr[0]
    puts arr[1]
    song = Song.new_by_name(arr[1].strip.chomp(".mp3"))
    song.artist_name = arr[0].strip
    song
  end
  
  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
