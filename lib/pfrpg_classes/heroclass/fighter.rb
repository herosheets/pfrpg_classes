class PfrpgClasses::Fighter < PfrpgClasses::Heroclass

  def name
    "Fighter"
  end

  def hit_die
    PfrpgCore::Dice.new(1,10)
  end

  def starting_wealth
    PfrpgCore::Dice.new(5,6, multiplier = 10)
  end

  def starting_wealth_avg
    140
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def description
    "Fighters excel at combat—defeating their enemies, controlling the flow of battle, and surviving such sorties themselves. While their specific weapons and methods grant them a wide variety of tactics, few can match fighters for sheer battle prowess."
  end

  def skills
    [
     PfrpgSkills::Climb.new,
     PfrpgSkills::Craft.new,
     PfrpgSkills::HandleAnimal.new,
     PfrpgSkills::Intimidate.new,
     PfrpgSkills::Knowledge.new('Dungeoneering'),
     PfrpgSkills::Knowledge.new('Engineering'),
     PfrpgSkills::Profession.new,
     PfrpgSkills::Ride.new,
     PfrpgSkills::Survival.new,
     PfrpgSkills::Swim.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Fighter.level_bonus(level)
  end

  def get_spells_table(level)
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    2
  end

  def feature_type
    'FighterFeature'
  end

  def starting_feats
    [
      "Light Armor Proficiency",
      "Medium Armor Proficiency",
      "Heavy Armor Proficiency",
      "Shield Armor Proficiency",
      "Simple Weapon Proficiency",
      "Martial Weapon Proficiency, All",
    ]
  end

  def suggested_items
    [
      ['Longsword', 'Scale mail', 'Shield, light steel'],
      ['Greatsword', 'Scale mail']
    ]
  end
end
