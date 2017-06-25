module BattlesHelper
  def time_format(battle)
    "#{battle.created_at.strftime('%Y年%m月%d日 %H:%M')}"
  end

  def my_poke_format(battle, sep)
    battle.my_pokes.map { |m|
      m.name
    }.join(sep)
  end
  
  def opp_poke_format(battle, sep)
    battle.opp_pokes.map { |m|
      m.name
    }.join(sep)
  end

  def battle_sum(battle)
    "#{time_format(battle)}: #{my_poke_format(battle, ', ')} VS #{opp_poke_format(battle, ', ')}"
  end

  def comment(battle, poke)
    if poke.class == MyPoke then
      poke.battle_my_pokes.find_by(battle_id: battle.id).comment
    else
      poke.battle_opp_pokes.find_by(battle_id: battle.id).comment
    end
  end
end
