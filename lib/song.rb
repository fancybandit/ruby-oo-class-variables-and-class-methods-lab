
class Song

    @@count = 0
    @@genres = []
    @@artists = []

    attr_accessor :name, :artist, :genre

    def initialize(name, artist, genre)
        self.name = name
        self.artist = artist
        self.genre = genre
        @@count += 1
        @@genres << genre
        @@artists << artist
    end

    def self.count
        @@count
    end

    def self.genres
        uniques = []
        uniques += @@genres
        uniques.each_with_index do |genre, index|
            matches = @@genres.select {|i| i == genre}
            matches.length > 1 ? uniques.delete_at(index) : nil
        end
        uniques
    end

    def self.artists
        uniques = []
        uniques += @@artists
        uniques.each_with_index do |name, index|
            matches = @@artists.select {|i| i == name}
            matches.length > 1 ? uniques.delete_at(index) : nil
        end
        uniques
    end
    
    def self.genre_count
      genre_hash = {}
      self.genres.each do |genre|
        matches = @@genres.select {|i| i == genre}
        genre_hash[genre] = matches.length
      end
      genre_hash
    end

    def self.artist_count
      artist_hash = {}
      self.artists.each do |name|
        matches = @@artists.select {|i| i == name}
        artist_hash[name] = matches.length
      end
      artist_hash
    end
end