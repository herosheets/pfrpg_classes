class PfrpgClasses::Barbarian < PfrpgClasses::Heroclass

  def name
    "Barbarian"
  end

  def hit_die
     PfrpgCore::Dice.new(1,12)
  end

  def starting_wealth
     PfrpgCore::Dice.new(3,6, multiplier = 10)
  end

  def starting_wealth_avg
    105
  end

  def bonuses_for_level(level)
     PfrpgTables::Tables::Heroclasses::Barbarian.level_bonus(level)
  end

  def create_feature(f)
    BarbarianFeature.new(:ability_name => f)
  end

  def alignment
     PfrpgCore::Alignment.never_lawful
  end

  def skills_per_level
    4
  end

  def get_spells_table(level)
    return  PfrpgTables::Spells::SpellsPerDay.empty
  end

  def description
    "Barbarians excel in combat, possessing the martial prowess and fortitude to take on foes seemingly far superior to themselves. With rage granting them boldness and daring beyond that of most other warriors, barbarians charge furiously into battle and ruin all who would stand in their way."
  end

  def skills
    [PfrpgSkills::Acrobatics.new,
     PfrpgSkills::Climb.new,
     PfrpgSkills::Craft.new,
     PfrpgSkills::HandleAnimal.new,
     PfrpgSkills::Intimidate.new,
     PfrpgSkills::Knowledge.new("Nature"),
     PfrpgSkills::Perception.new,
     PfrpgSkills::Ride.new,
     PfrpgSkills::Survival.new,
     PfrpgSkills::Swim.new,
    ]
  end

  def feature_type
    "BarbarianFeature"
  end

  def starting_feats
    [
      "Light Armor Proficiency",
      "Medium Armor Proficiency",
      "Shield Proficiency",
      "Simple Weapon Proficiency",
      "Martial Weapon Proficiency, All"
    ]
  end

  def suggested_items
    [
      ['Greatsword', 'Leather']
    ]
  end
end

