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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(song_name)
    # song = Song.new
    # song.name = song_name
    #BETTER:
    song = self.new_by_name(song_name)
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{ |n| n.name == song_name} #looks at each song in the array and finds the one that matches the name
  end

  def self.find_or_create_by_name(song_name)
    #returns a matching song instance with that name OR creates a new song with the name and returns the song instance
    if self.all.include?(self.find_by_name(song_name)) == true
      return self.find_by_name(song_name)
    else
      return self.create_by_name(song_name)
    end
    #OR
      #  self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{ |n| n.name}
  end

  # def self.new_from_filename(filename)
  #   song_artist_name = ""
  #   song_name = ""
  #
  #   info = filename.split(" - ")
  #   info.collect do |value|
  #     song_artist_name = value[0]
  #     # song_name = value[1]#.chomp(".mp3")
  #     song_name = parts[1].gsub(".mp3", "")
  #   end
  #   song = Song.new
  #   song.artist_name = song_artist_name
  #   song.name = song_name
  #
  #   self.all << song


    def self.new_from_filename(filename)
      parts = filename.split(" - ")
      artist_name = parts[0]
      song_name = parts[1].gsub(".mp3", "")

      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
    end


    def self.new_from_filename(filename)
      parts = filename.split(" - ")
      artist_name = parts[0]
      song_name = parts[1].gsub(".mp3", "")

      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
    end

    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      self.all << song
    end

    def self.destroy_all
      self.all.clear
    end
end
