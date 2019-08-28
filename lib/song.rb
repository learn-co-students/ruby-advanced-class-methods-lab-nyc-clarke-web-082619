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
   if self.find_by_name(song_name)
    return self.find_by_name(song_name)
   else
    self.create_by_name(song_name)
   end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_details = file_name.split(' - ')
    artist = song_details[0]
    title_ext = song_details[1].split('.')
    song_title = title_ext[0]
    song = self.new 
    song.name = song_title
    song.artist_name = artist
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
