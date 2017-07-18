require 'test_helper'

class BattleTest < ActiveSupport::TestCase
  def setup
    @battle = Battle.new(my_rate: 1500, opp_rate: 1500, result: true)
    3.times do |i|
      @battle.my_pokes.build(id: i, name: PokeData.find(i).name)
      @battle.opp_pokes.build(id: i, name: PokeData.find(i).name)
    end
  end

  test "should be valid" do
    assert @battle.valid?
  end

  test "my_rate should be present" do
    @battle.my_rate = nil
    assert_not @battle.valid?
  end

  test "opp_rate should be present" do
    @battle.opp_rate = nil
    assert_not @battle.valid?
  end

  test "battle.opp_poke should be unique" do
    @battle.opp_pokes[0].name = @battle.opp_pokes[1].name
    assert_not @battle.valid?
  end

  test "battle.battle_my_pokes.my_poke_id should be unique" do
    @battle.my_pokes[0] = @battle.battle_my_pokes[1]
    assert_not @battle.valid?
  end
end
