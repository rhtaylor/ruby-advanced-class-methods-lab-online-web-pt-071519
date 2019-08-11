class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end
  def save
    self.class.all << self
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
      @@all.find{ |x| x.name == name }
    end
    def self.find_or_create_by_name(name)
      if find_by_name(name)
          find_by_name(name)
      else create_by_name(name)
      end
    end
    def self.alphabetical
      x = @@all.sort_by{ |song| song.name }
      x
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
    pieces = filename.split(" - ")
    y = pieces.map do |mod|
      mod.gsub(".mp3", "")
    end
    artist = y[0]
    songname = y[1]
    song = self.create
    song.name = songname
    song.artist_name = artist

    song
  end
  def self.destroy_all
    self.all.clear
  end
end
