class PfrpgClasses::Cleric < PfrpgClasses::Heroclass

  def heroclass_id
    3
  end

  def name
    "Cleric"
  end

  def hit_die
    PfrpgCore::Dice.new(1,8)
  end

  def starting_wealth
    PfrpgCore::Dice.new(5,6, multiplier = 10)
  end

  def starting_wealth_avg
    140
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Cleric.level_bonus(level)
  end

  def create_feature(f)
    ClericFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def description
    "More than capable of upholding the honor of their deities in battle, clerics often prove stalwart and capable combatants. Their true strength lies in their capability to draw upon the power of their deities, whether to increase their own and their allies' prowess in battle, to vex their foes with divine magic, or to lend healing to companions in need. As their powers are influenced by their faith, all clerics must focus their worship upon a divine source. While the vast majority of clerics revere a specific deity, a small number dedicate themselves to a divine concept worthy of devotion—such as battle, death, justice, or knowledge—free of a deific abstraction. (Work with your GM if you prefer this path to selecting a specific deity.)"
  end

  def skills
    [
     PfrpgSkills::Skill::Appraise.new,
     PfrpgSkills::Skill::Craft.new,
     PfrpgSkills::Skill::Diplomacy.new,
     PfrpgSkills::Skill::Heal.new,
     PfrpgSkills::Skill::Knowledge.new('Arcana'),
     PfrpgSkills::Skill::Knowledge.new('History'),
     PfrpgSkills::Skill::Knowledge.new('Nobility'),
     PfrpgSkills::Skill::Knowledge.new('Planes'),
     PfrpgSkills::Skill::Knowledge.new('Religion'),
     PfrpgSkills::Skill::Linguistics.new,
     PfrpgSkills::Skill::Profession.new,
     PfrpgSkills::Skill::Spellcraft.new,
    ]
  end

  def get_spells_table(level)
    return PfrpgTables::Tables::Spells::SpellsPerDay.Cleric(level)
  end

  def spells_bonus_attr
    "wis"
  end

  def skills_per_level
    2
  end

  def feature_type
    "ClericFeature"
  end

  def starting_feats
    [
      "Light Armor Proficiency",
      "Medium Armor Proficiency",
      "Shield Proficiency",
      "Simple Weapon Proficiency"
    ]
  end

  def suggested_items
    [
      ['Morningstar', 'Leather', 'Buckler'],
      ['Crossbow, light', 'Leather', 'Crossbow bolt(s), heavy/light/hand (10)']
    ]
  end
end
