class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song.save 
    song 
  end

  def self.find_by_name(song_name)
    @@all.find{|title| title.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
   self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_details = file_name.split(' - ')
    song = self.new 
    song.name = song_details[1].chomp('.mp3')
    song.artist_name = song_details[0]
    song 
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def save
    self.class.all << self
  end
 
  
  def self.destroy_all
    self.all.clear
  end

end
