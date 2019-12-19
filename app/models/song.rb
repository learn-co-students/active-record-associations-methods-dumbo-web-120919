class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    drake_check = Artist.find_by(name: "Drake")
    if drake_check == nil
      drake = Artist.create(name: "Drake")
      self.artist = drake
    elsif !!drake_check == true
      drake = Artist.find_by(name: "Drake")
      self.artist = drake
    end

    # Could also do:
    # drake = Artist.find_or_create_by(name: "Drake")
    # self.artist = drake
    
  end
end