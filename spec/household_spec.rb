require 'rspec'
require './lib/animal'
require './lib/skill'
require './lib/household'
require 'pry'

describe Household do 
  it 'exists' do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    shake = Skill.new("shake", true)
    sing = Skill.new("sing", true)
    animal_1 = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal_2 = Animal.new({name: "Lion", type: "cat", skills: [sit, shake, play_dead]})
    animal_3 = Animal.new({name: "Richard", type: "bird", skills: [sing, shake]})
    house_1 = Household.new([animal_1,animal_2, animal_3])

    expect(house_1).to be_an_instance_of(Household)
  end

  it 'can list animals that know a certain skill' do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    shake = Skill.new("shake", true)
    sing = Skill.new("sing", true)
    animal_1 = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal_2 = Animal.new({name: "Lion", type: "cat", skills: [sit, shake, play_dead]})
    animal_3 = Animal.new({name: "Richard", type: "bird", skills: [sing, shake]})

    house_1 = Household.new([animal_1,animal_2, animal_3])

    expect(house_1.animals_with_skill(sit)).to eq([animal_1,animal_2])
    expect(house_1.animals_with_skill(shake)).to eq([animal_2,animal_3])
  end

  it 'can list animals without any party tricks' do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    shake = Skill.new("shake", true)
    sing = Skill.new("sing", true)
    animal_1 = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal_2 = Animal.new({name: "Pheebs", type: "dog", skills: [sit, down]})
    animal_3 = Animal.new({name: "Lion", type: "cat", skills: [sit]})
    animal_4 = Animal.new({name: "Richard", type: "bird", skills: [sing, shake]})

    house_1 = Household.new([animal_1,animal_2, animal_3, animal_4])

    expect(house_1.no_party_tricks).to eq([animal_2, animal_3])
  end
end
