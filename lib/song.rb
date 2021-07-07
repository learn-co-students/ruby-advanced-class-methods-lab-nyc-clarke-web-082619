require "pry"
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
      song = self.create
      song.name = name
      song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end



  def self.alphabetical
    name_arr = @@all.sort_by {|song| song.name}
    name_arr
  end

  def self.destroy_all
    @@all.clear
  end
  
  def self.new_from_filename(file_name)
    info = file_name.split(" - ")
    artist_name = info[0]
    name = info[1].slice(0..-5)
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    info = file_name.split(" - ")
    artist_name = info[0]
    name = info[1].slice(0..-5)
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end


end
