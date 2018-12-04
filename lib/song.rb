require 'pry'

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
=begin    
    #alternate way
    array = []
    self.all.map do |song| 
     array << song if name == song.name
    end
    array.compact[0]
  end
=end
    self.all.find {|song| song if name == song.name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename) 
    array = filename.split(" - ")
    new_array = array.map {|word| word.gsub(/.mp3/, '')}
    artist_name = new_array[0]
    song_name = new_array[1]
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    array = filename.split(" - ")
    new_array = array.map {|word| word.gsub(/.mp3/, '')}
    artist_name = new_array[0]
    song_name = new_array[1]
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end