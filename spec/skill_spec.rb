require 'rspec'
require './lib/animal'
require './lib/skill'
require 'pry'

describe Skill do 
  it  'it exists' do 
    sit = Skill.new("sit")

    expect(sit).to be_an_instance_of(Skill)
  end

  it  'it has attributes' do 
    sit = Skill.new("sit")

    expect(sit.command).to eq("sit") 
  end

  it  'party trick defaults to false' do 
    sit  = Skill.new("sit")

    expect(sit.party_trick?).to eq(false)
  end

  it  'skill can be a party trick' do 
    play_dead = Skill.new("play dead", true)

    expect(play_dead.party_trick?).to eq(true)
  end
end
