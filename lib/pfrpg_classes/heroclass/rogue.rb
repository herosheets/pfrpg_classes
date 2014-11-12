class PfrpgClasses::Rogue < PfrpgClasses::Heroclass

  def name
    "Rogue"
  end

  def heroclass_id
    2
  end

  def hit_die
    PfrpgCore::Dice.new(1,8)
  end

  def starting_wealth
    PfrpgCore::Dice.new(4,6, multiplier = 10)
  end

  def starting_wealth_avg
    140
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Rogue.level_bonus(level)
  end

  def create_feature(f)
    RogueFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def skills_per_level
    8
  end

  def get_spells_table(level)
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def description
    "Rogues excel at moving about unseen and catching foes unaware, and tend to avoid head-to-head combat. Their varied skills and abilities allow them to be highly versatile, with great variations in expertise existing between different rogues. Most, however, excel in overcoming hindrances of all types, from unlocking doors and disarming traps to outwitting magical hazards and conning dull-witted opponents."
  end

  def skills
    [PfrpgSkills::Acrobatics.new,
     PfrpgSkills::Appraise.new,
     PfrpgSkills::Bluff.new,
     PfrpgSkills::Climb.new,
     PfrpgSkills::Craft.new,
     PfrpgSkills::Diplomacy.new,
     PfrpgSkills::DisableDevice.new,
     PfrpgSkills::Disguise.new,
     PfrpgSkills::EscapeArtist.new,
     PfrpgSkills::Intimidate.new,
     PfrpgSkills::Knowledge.new("Dungeoneering"),
     PfrpgSkills::Knowledge.new("Local"),
     PfrpgSkills::Linguistics.new,
     PfrpgSkills::Perception.new,
     PfrpgSkills::Perform.new,
     PfrpgSkills::Profession.new,
     PfrpgSkills::SenseMotive.new,
     PfrpgSkills::SleightOfHand.new,
     PfrpgSkills::Stealth.new,
     PfrpgSkills::Swim.new,
     PfrpgSkills::UseMagicDevice.new
    ]
  end

  def feature_type
    "RogueFeature"
  end

  def starting_feats
    [
      "Light Armor Proficiency",
      "Simple Weapon Proficiency",
      "Rogue Weapon Proficiency"
    ]
  end

  def suggested_items
    [
      ['Sword, short', 'Sword, short', 'Leather'],
      ['Longbow', 'Leather', 'Arrow(s), common (20)']
    ]
  end
end
