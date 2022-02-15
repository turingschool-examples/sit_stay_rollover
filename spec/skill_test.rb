require 'rspect'
require './lib/animal'
require './lib/skill'
require 'pry'

describe Skill
  it  'it_exists' do 
    sit = Skill.new("sit")

    expect(sit).to eq(Skill)
  end

  it  'it_has_attributes' do 
    sit = Skill.new("sit")

    expect(sit.command).to eq("sit") 
  end

  it  'party trick defaults to false' do 
    sit  = Skill.new("sit")

    expect(sit.party_trick?).to eq(false)
  end

  it  'skill_can_be_a_party_trick' do 
    play_dead = Skill.new("play dead", true)

    expect(play_dead.party_trick?).to eq(true)
  end
end
