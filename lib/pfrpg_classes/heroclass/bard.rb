class PfrpgClasses::Bard < PfrpgClasses::Heroclass

  def name
    "Bard"
  end

  def hit_die
     PfrpgCore::Dice.new(1,8)
  end

  def starting_wealth
     PfrpgCore::Dice.new(3,6, multiplier = 10)
  end

  def starting_wealth_avg
    105
  end

  def bonuses_for_level(level)
     PfrpgTables::Heroclasses::Bard.level_bonus(level)
  end

  def create_feature(f)
    BardFeature.new(:ability_name => f)
  end

  def alignment
     PfrpgCore::Alignment.any
  end

  def skills_per_level
    6
  end

  def get_spells_table(level)
    return  PfrpgTables::Spells::SpellsPerDay.Bard(level)
  end

  def spells_bonus_attr
    "cha"
  end

  def description
    "Bards capably confuse and confound their foes while inspiring their allies to ever-greater daring. While accomplished with both weapons and magic, the true strength of bards lies outside melee, where they can support their companions and undermine their foes without fear of interruptions to their performances."
  end

  def skills
    [PfrpgSkills::Acrobatics.new,
     PfrpgSkills::Appraise.new,
     PfrpgSkills::Bluff.new,
     PfrpgSkills::Climb.new,
     PfrpgSkills::Craft.new,
     PfrpgSkills::Diplomacy.new,
     PfrpgSkills::Disguise.new,
     PfrpgSkills::EscapeArtist.new,
     PfrpgSkills::Intimidate.new,
     PfrpgSkills::Knowledge.new('Arcana'),
     PfrpgSkills::Knowledge.new('Dungeoneering'),
     PfrpgSkills::Knowledge.new('Engineering'),
     PfrpgSkills::Knowledge.new('Geography'),
     PfrpgSkills::Knowledge.new('History'),
     PfrpgSkills::Knowledge.new('Local'),
     PfrpgSkills::Knowledge.new('Nature'),
     PfrpgSkills::Knowledge.new('Nobility'),
     PfrpgSkills::Knowledge.new('Planes'),
     PfrpgSkills::Knowledge.new('Religion'),
     PfrpgSkills::Linguistics.new,
     PfrpgSkills::Perception.new,
     PfrpgSkills::Perform.new,
     PfrpgSkills::Profession.new,
     PfrpgSkills::SenseMotive.new,
     PfrpgSkills::SleightOfHand.new,
     PfrpgSkills::Spellcraft.new,
     PfrpgSkills::Stealth.new,
     PfrpgSkills::UseMagicDevice.new
    ]
  end

  def feature_type
    "BardFeature"
  end

  def starting_feats
    [
      "Light Armor Proficiency",
      "Simple Weapon Proficiency",
      "Shield Proficiency",
      "Bard Weapon Proficiency"
    ]
  end

  def suggested_items
    [
      ['Sword, short', 'Leather', 'Buckler'],
      ['Shortbow', 'Leather']
    ]
  end
end
