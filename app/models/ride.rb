class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        response = "Sorry."
        if self.user.tickets < self.attraction.tickets
           response << " You do not have enough tickets to ride the #{self.attraction.name}."
        end 
        if self.user.height < self.attraction.min_height
            response << " You are not tall enough to ride the #{self.attraction.name}."
        end
        if response == "Sorry."
            response = "Thanks for riding the #{self.attraction.name}!"
            self.user.tickets = self.user.tickets - self.attraction.tickets
            self.user.nausea = self.user.nausea + self.attraction.nausea_rating
            self.user.happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.save
        end
        response
    end


end
