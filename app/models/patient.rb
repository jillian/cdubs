class Patient < ActiveRecord::Base

	def self.search(term)
	  where('last_name ILIKE :term OR first_name ILIKE :term', term: "%#{term.downcase}%")
	end

end

# search = params[:manufacturer].parameterize
# @cars = @cars.joins(:manufacturers).where("manufacturers.name LIKE ?", "%#{search}%")