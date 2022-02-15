require 'rspec'
require './lib/animal'
require './lib/skill'
require 'pry'

describe Animal do
  it "exists" do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)

    animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    expect(animal).to be_an_instance_of(Animal)
  end

  it 'has attributes' do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)

    animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})

    expect(animal.name).to eq "Odell"
    expect(animal.type).to eq "dog"
    expect(animal.skills).to eq [sit, down, play_dead]
   end

   it 'can forget skils' do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)

    animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal.forget_skill(play_dead)

    expect(animal.skills).to eq([sit,down])
   end 

   it 'can count how many party tricks an animal has' do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    shake = Skill.new("shake", true)

    animal_1 = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal_2 = Animal.new({name: "Lion", type: "cat", skills: [sit, shake, play_dead]})

    expect(animal_1.number_of_party_tricks).to eq(1)
    expect(animal_2.number_of_party_tricks).to eq(2)
   end 

   it 'can list commands by party trick or not' do 
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)

    animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})

    expected = {party_tricks: [play_dead] , not_party_tricks: [sit, down]}

    expect(animal.categorize_commands).to eq(expected)
   end 

end
