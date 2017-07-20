require 'test_helper'

class OppPokeTest < ActiveSupport::TestCase
  def setup
    @opp_poke = OppPoke.new(name: PokeData.find(0).name, item: "きあいのタスキ", ability: "しんりょく")
  end

  test "should be valid" do
    assert @opp_poke.valid?
  end

  # 名前がありえるかチェック
  test "opp_poke.name should be poke name" do
    @opp_poke.name = "a"
    assert_not @opp_poke.valid?
  end

  # とくせいがありえるかチェック
end
