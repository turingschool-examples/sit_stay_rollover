require 'minitest/autorun'
require 'minitest/pride'
require './lib/animal'
require './lib/skill'
require 'pry'
require './lib/household'

class HouseholdTest <Minitest::Test
  def test_it_exists
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    shake = Skill.new("shake", true)
    sing = Skill.new("sing", true)
    animal_1 = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal_2 = Animal.new({name: "Lion", type: "cat", skills: [sit, shake, play_dead]})
    animal_3 = Animal.new({name: "Richard", type: "bird", skills: [sing, shake]})
    house_1 = Household.new([animal_1,animal_2, animal_3])

    assert_instance_of Household, house_1
  end

  def test_it_can_list_animals_that_know_a_certain_skill
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    shake = Skill.new("shake", true)
    sing = Skill.new("sing", true)
    animal_1 = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal_2 = Animal.new({name: "Lion", type: "cat", skills: [sit, shake, play_dead]})
    animal_3 = Animal.new({name: "Richard", type: "bird", skills: [sing, shake]})

    house_1 = Household.new([animal_1,animal_2, animal_3])

    assert_equal [animal_1,animal_2], house_1.animals_with_skill(sit)
    assert_equal [animal_2,animal_3], house_1.animals_with_skill(shake)
  end

  def test_it_can_lists_animals_without_any_party_tricks
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

    assert_equal [animal_2, animal_3], house_1.no_party_tricks
  end
end
