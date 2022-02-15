class Animal 
    attr_reader :name, :type, :skills
    def initialize(details) 
        @name = details[:name]
        @type = details[:type]
        @skills = details[:skills]
    end 

    def forget_skill(skill)
        @skills.delete(skill)
    end 

    def number_of_party_tricks
        party_tricks.count
    end 

    def party_tricks 
        @skills.find_all do |skill| 
            skill.party_trick?
        end
    end     
    def non_party_tricks 
        @skills.find_all do |skill| 
            !skill.party_trick?
        end
    end     

    def categorize_commands
        skill_hash = {}
        skill_hash[:party_tricks] = party_tricks
        skill_hash[:not_party_tricks] = non_party_tricks
        skill_hash
    end 
end 
