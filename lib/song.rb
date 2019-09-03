require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  #  def initialize
  #    @name = name 
  #    @@all << self
  #    self.save 
  #    @@artist_name = artist_name


  # end 

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
    song = self.create
    song.name = name  
    song
   end

   def self.create_by_name(name)
    song = self.new_by_name(name)
    song
   end 

   def self.find_by_name(name)
    #  song = self.name
    song = @@all.find {|song| song.name == name}
    # song = self.include?(name)
    # song(name)
      # @name = name 
      # song = self.new_by_name
      # song = self.create_by_name(name)
      # song
      # self.all.include?(name)
    end

  #  binding.pry

    def self.find_or_create_by_name(title)
      # if self.find_by_name(name)
      #     p self(name)
      # else 
      #   self.create_by_name(name)
      # end 
      find = self.find_by_name(title)
      create = self.create_by_name(title)
      if find
        find 
      else
        create
      end 
    end

    def self.alphabetical 
    
      self.all.sort_by {|word| word.name} # not by length but something specifically what i want the iteration to do by name
  
    end 

    def self.new_from_filename(filename)
      song_array = filename.split(" - ")
      song_array[1] = song_array[1].chomp(".mp3")
      song = self.new
      song.name = song_array[1]
      song.artist_name = song_array[0]
      song
    end

    def self.create_from_filename(filename)
      create = self.new_from_filename(filename)
      song = self.create
      song.name = create.name
      song.artist_name = create.artist_name
      song
    end 

    def self.destroy_all
      self.all.clear
    end



end
