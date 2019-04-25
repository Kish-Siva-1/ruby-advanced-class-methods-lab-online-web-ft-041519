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
    new_name.split(Regexp.union([" - ", "."]))
    song.name = 
    song.artist_name = 
  end
  
  describe '.new_from_filename' do
    it 'initializes a song and artist_name based on the filename format' do
      song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

      expect(song.name).to eq("For Love I Come")
      expect(song.artist_name).to eq("Thundercat")
    end
  end
  
  def self.create_from_filename
    
  end
  
  describe '.create_from_filename' do
    it 'initializes and saves a song and artist_name based on the filename format' do
      song = Song.create_from_filename("Thundercat - For Love I Come.mp3")
      song_match = Song.find_by_name("For Love I Come")
      expect(song_match.name).to eq("For Love I Come")
      expect(song_match.artist_name).to eq("Thundercat")
    end
  end

  def self.destroy_all
      
  end
  
  describe '.destroy_all' do
    it 'clears all the song instances from the @@all array' do
      Song.destroy_all
      expect(Song.all).to eq([])
    end
  end
end