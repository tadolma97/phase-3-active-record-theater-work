class Role < ActiveRecord::Base
    has_many :auditions
    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead 
        if self.audtions.where(hired: true).first.nil?
            return "no actor has been hired yet"
        end
        self.audtions.where(hired: true).first
    end
    
end