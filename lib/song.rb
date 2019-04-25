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
    @@all << self.new
    @@all[-1]
  end 

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    song
  end 
  
  def self.create_by_name(new_name)
    song = self.create
    song.name = new_name 
    song
  end  

  def self.find_by_name(find_name)
    self.all.find{|value| find_name==value.name} 
  end

  def self.find_or_create_by_name(new_name)
    
    if self.find_by_name(new_name)
      self.find_by_name(new_name)
    else 
      self.create_by_name(new_name)
    end 
    
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(new_name)
    name_array = new_name.split(Regexp.union([" - ", "."]))
    song = new_by_name(name_array[1])
    song.artist_name = name_array[0]
    song
  end
  
  def self.create_from_filename(new_name)
    name_array = new_name.split(Regexp.union([" - ", "."]))
    song = find_or_create_by_name(name_array[1])
    song.artist_name = name_array[0]
    song
  end

  def self.destroy_all
      @@all.clear
  end
  
  describe '.destroy_all' do
    it 'clears all the song instances from the @@all array' do
      Song.destroy_all
      expect(Song.all).to eq([])
    end
  end
end