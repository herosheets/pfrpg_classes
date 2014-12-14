class PfrpgClasses::Sorcerer < PfrpgClasses::Heroclass

  def name
    "Sorcerer"
  end

  def hit_die
    PfrpgCore::Dice.new(1,6)
  end

  def starting_wealth
    PfrpgCore::Dice.new(2,6, multiplier = 10)
  end

  def starting_wealth_avg
    70
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Sorcerer.level_bonus(level)
  end

  def create_feature(f)
    SorcererFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def skills_per_level
    2
  end

  def get_spells_table(level)
    return PfrpgTables::Tables::Spells::SpellsPerDay.Sorcerer(level)
  end

  def spells_bonus_attr
    "cha"
  end

  def description
    "Sorcerers excel at casting a selection of favored spells frequently, making them powerful battle mages. As they become familiar with a specific and ever-widening set of spells, sorcerers often discover new and versatile ways of making use of magics other spellcasters might overlook. Their bloodlines also grant them additional abilities, assuring that no two sorcerers are ever quite alike."
  end

  def skills
    [PfrpgSkills::Skill::Appraise.new,
     PfrpgSkills::Skill::Bluff.new,
     PfrpgSkills::Skill::Craft.new,
     PfrpgSkills::Skill::Fly.new,
     PfrpgSkills::Skill::Intimidate.new,
     PfrpgSkills::Skill::Knowledge.new('Arcana'),
     PfrpgSkills::Skill::Profession.new,
     PfrpgSkills::Skill::Spellcraft.new,
     PfrpgSkills::Skill::UseMagicDevice.new
    ]
  end

  def feature_type
    "SorcererFeature"
  end

  def spells_known(level)
    return PfrpgTables::Tables::Spells.sorcerer_spells_known[level]
  end

  def starting_feats
    [
      "Simple Weapon Proficiency"
    ]
  end

  def suggested_items
    [
      ['Quarterstaff'],
      ['Dagger']
    ]
  end
end

