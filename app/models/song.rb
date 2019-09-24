class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { :scope => [:artist_name, :release_year],
    message: 'cannot be repeated by the same artist in the same year'}
    validates :released, inclusion: { in: [true, false] }
    
# validates :release_year, presence: true, :if => lambda  { self.released } 
    validates_presence_of :release_year,  :if => lambda  { self.released == true } 
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year} ,  :if => lambda  { self.released == true } 
    validates :artist_name, presence: true
end
