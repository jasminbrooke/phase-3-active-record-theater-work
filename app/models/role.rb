class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map(&:actor)
    end

    def locations
        self.auditions.map(&:location)
    end

    def lead
        return self.auditions.find_by(hired: true)
    
        "no actors has been hired for this role"
    end

    def understudy
        return self.auditions.find_all(&:hired).second
        
        "no actors has been hired for understudy this role"
    end

end