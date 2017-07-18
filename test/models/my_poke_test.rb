require 'test_helper'

class MyPokeTest < ActiveSupport::TestCase
  def setup
    @my_poke = MyPoke.new(name: PokeData.find(0).name, item: "きあいのタスキ", ability: "しんりょく")
  end

  test "should be valid" do
    assert @my_poke.valid?
  end

  # 名前がありえるかチェック
  test "my_poke.name should be poke name" do
    @my_poke.name = "a"
    assert_not @my_poke.valid?
  end

  # とくせいがありえるかチェック
end
