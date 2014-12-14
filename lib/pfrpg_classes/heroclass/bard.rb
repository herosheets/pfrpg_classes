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
     PfrpgTables::Tables::Heroclasses::Bard.level_bonus(level)
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
    return  PfrpgTables::Tables::Spells::SpellsPerDay.Bard(level)
  end

  def spells_bonus_attr
    "cha"
  end

  def description
    "Bards capably confuse and confound their foes while inspiring their allies to ever-greater daring. While accomplished with both weapons and magic, the true strength of bards lies outside melee, where they can support their companions and undermine their foes without fear of interruptions to their performances."
  end

  def skills
    [PfrpgSkills::Skill::Acrobatics.new,
     PfrpgSkills::Skill::Appraise.new,
     PfrpgSkills::Skill::Bluff.new,
     PfrpgSkills::Skill::Climb.new,
     PfrpgSkills::Skill::Craft.new,
     PfrpgSkills::Skill::Diplomacy.new,
     PfrpgSkills::Skill::Disguise.new,
     PfrpgSkills::Skill::EscapeArtist.new,
     PfrpgSkills::Skill::Intimidate.new,
     PfrpgSkills::Skill::Knowledge.new('Arcana'),
     PfrpgSkills::Skill::Knowledge.new('Dungeoneering'),
     PfrpgSkills::Skill::Knowledge.new('Engineering'),
     PfrpgSkills::Skill::Knowledge.new('Geography'),
     PfrpgSkills::Skill::Knowledge.new('History'),
     PfrpgSkills::Skill::Knowledge.new('Local'),
     PfrpgSkills::Skill::Knowledge.new('Nature'),
     PfrpgSkills::Skill::Knowledge.new('Nobility'),
     PfrpgSkills::Skill::Knowledge.new('Planes'),
     PfrpgSkills::Skill::Knowledge.new('Religion'),
     PfrpgSkills::Skill::Linguistics.new,
     PfrpgSkills::Skill::Perception.new,
     PfrpgSkills::Skill::Perform.new,
     PfrpgSkills::Skill::Profession.new,
     PfrpgSkills::Skill::SenseMotive.new,
     PfrpgSkills::Skill::SleightOfHand.new,
     PfrpgSkills::Skill::Spellcraft.new,
     PfrpgSkills::Skill::Stealth.new,
     PfrpgSkills::Skill::UseMagicDevice.new
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
