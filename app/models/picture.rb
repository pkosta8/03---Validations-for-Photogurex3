class Picture < ApplicationRecord

  validates :artist, presence: true
  validates :title, length: { minimum: 3, maximum: 20 }
  validates :url, presence: true, uniqueness: true
    # validates :url, uniqueness: true

    def validation_purposes
      error.messages [:artist] << "enter artist"
      error.messages [:title] << "enter title min. 3 to 20 character max"
        error.messages [:url] << "enter url"
    end


  def self.month
    Picture.where("created_at < ?", 1.month.ago)
  end

  def self.all_years_array
  years = []
  Picture.all.each do |picture|
    years << picture.created_at.year
  end
  years.uniq.sort.reverse
end



def self.pictures_by_year(year)
  pictures = []
  Picture.all.each do |picture|
    if picture.created_at.year == year
      pictures << picture
      end
    end
  end
end


  #
  # def self.year
  #   Picture.where("created_at < ?", 1.year.ago)
  # end

# def self.pictures_by_year(year)
#   pictures = []
#   Picture.all.each do |picture|
#     if picture.created_at.year <= year
#       pictures << picture
#       end
#     end
#   end
# end
