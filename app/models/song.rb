class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    #binding.pry
    gen_instance = Genre.all.find do |gen|
      gen.id == self.genre_id
    end
    gen_instance.name 
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    bam = Artist.all.find_by(name: "Drake")
    if !bam 
      bam = Artist.create(name: "Drake")
    end 
    #binding.pry
    self.artist_id = bam.id
    self
    # Song.all.select do |one_song|
    #   one_song.artist_id == new_art.id
    #     if new_art.id == nil
    #       saved = Artist.create(name: "Drake")
    #     end
    
  end
end