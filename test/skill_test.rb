require 'minitest/autorun'
require 'minitest/pride'
require './lib/animal'
require './lib/skill'
require 'pry'

class SkillTest <Minitest::Test
  def test_it_exists
    sit = Skill.new("sit")

    assert_instance_of Skill, sit
  end

  def test_it_has_attributes
    sit = Skill.new("sit")

    assert_equal "sit", sit.command
  end

  def test_party_trick_is_defaulted_false
    sit  = Skill.new("sit")

    assert_equal false, sit.party_trick?
  end

  def test_skill_can_be_a_party_trick
    play_dead = Skill.new("play dead", true)

    assert play_dead.party_trick?
  end
end
