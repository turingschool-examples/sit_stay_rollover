require 'minitest/autorun'
require 'minitest/pride'
require './lib/animal'
require './lib/skill'
require 'pry'

class AnimalTest <Minitest::Test
  def test_it_exists
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)

    animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    assert_instance_of Animal, animal
  end

  def test_animal_has_attributes
    skip
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)

    animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})

    assert_equal "Odell", animal.name
    assert_equal "dog", animal.type
    assert_equal [sit, down, play_dead], animal.skills
  end


  def test_it_can_forget_skills
    skip
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})

    animal.forget_skill(play_dead)

    assert_equal [sit,down], animal.skills
  end

  def test_it_can_count_how_many_party_tricks_an_animal_has
    skip
    sit = Skill.new("sit")
    down = Skill.new("down")
    play_dead = Skill.new("play dead", true)
    shake = Skill.new("shake", true)

    animal_1 = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})
    animal_2 = Animal.new({name: "Lion", type: "cat", skills: [sit, shake, play_dead]})

    assert_equal 1, animal_1.number_of_party_tricks
    assert_equal 2, animal_2.number_of_party_tricks
  end


    def test_it_can_list_commands_by_party_trick_or_not
      skip
      sit = Skill.new("sit")
      down = Skill.new("down")
      play_dead = Skill.new("play dead", true)

      animal = Animal.new({name: "Odell", type: "dog", skills: [sit, down, play_dead]})

      expected = {party_tricks: ["play dead"] , not_party_tricks: ["sit","down"]}
      assert_equal expected, animal.categorize_commands
    end

end
