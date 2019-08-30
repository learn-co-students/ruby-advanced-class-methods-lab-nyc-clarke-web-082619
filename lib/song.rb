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
    song.save
    song
  end

  def self.create_by_name(name)
    new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.find {|song|song.name == name}
  end

  def self.alphabetical
    @@all.sort_by {|song|song.name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.new_from_filename(filename)
    
    filename = filename.slice(0...-4).split("-")
    song = new_by_name(filename[1].strip)
    song.artist_name = filename[0].strip
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
end

