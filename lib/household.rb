class Household 
    def initialize(animals)
        @animals = animals
    end 
    
    def animals_with_skill(skill) 
        @animals.find_all do |animal|
            animal.skills.include?(skill) 
        end 
    end 

    def no_party_tricks 
        @animals.find_all do |animal|
            animal.party_tricks.empty?
        end   
    end 
end 