require 'test_helper'

class BattleTest < ActiveSupport::TestCase
  def setup
    @battle = Battle.new(my_rate: 1500, opp_rate: 1500, result: true)
    3.times do |i|
      @battle.my_pokes.build(id: i, name: PokeData.find(i).name)
      @battle.opp_pokes.build(id: i, name: PokeData.find(i).name)
      @battle.battle_my_pokes.build(my_poke_id: i)
      @battle.battle_opp_pokes.build(opp_poke_id: i)
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

  test "battle.my_poke should be unique" do
    @battle.battle_my_pokes[0].my_poke_id = @battle.battle_my_pokes[1].my_poke_id
    assert_not @battle.valid?
  end

  test "battle.opp_poke's name should be unique" do
    @battle.opp_pokes[0].name = @battle.opp_pokes[1].name
    assert_not @battle.valid?
  end
end
