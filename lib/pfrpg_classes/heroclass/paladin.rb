class PfrpgClasses::Paladin < PfrpgClasses::Heroclass

  def name
    "Paladin"
  end

  def hit_die
    PfrpgCore::Dice.new(1,10)
  end

  def starting_wealth
    PfrpgCore::Dice.new(5,6, multiplier = 10)
  end

  def starting_wealth_avg
    175
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Paladin.level_bonus(level)
  end

  def create_feature(f)
    PaladinFeature.new(:ability_name => f)
  end

  def alignment
    "Lawful Good"
  end

  def skills_per_level
    2
  end

  def get_spells_table(level)
    return PfrpgTables::Spells::SpellsPerDay.Paladin(level)
  end

  def description
    "Paladins serve as beacons for their allies within the chaos of battle. While deadly opponents of evil, they can also empower goodly souls to aid in their crusades. Their magic and martial skills also make them well suited to defending others and blessing the fallen with the strength to continue fighting."
  end

  def spells_bonus_attr
    "wis"
  end

  def skills
    [PfrpgSkills::Craft.new,
     PfrpgSkills::Diplomacy.new,
     PfrpgSkills::HandleAnimal.new,
     PfrpgSkills::Heal.new,
     PfrpgSkills::Knowledge.new("Nobility"),
     PfrpgSkills::Knowledge.new("Religion"),
     PfrpgSkills::Profession.new,
     PfrpgSkills::Ride.new,
     PfrpgSkills::SenseMotive.new,
     PfrpgSkills::Spellcraft.new,
    ]
  end

  def feature_type
    "PaladinFeature"
  end

  def starting_feats
    [
      "Light Armor Proficiency",
      "Medium Armor Proficiency",
      "Heavy Armor Proficiency",
      "Simple Weapon Proficiency",
      "Martial Weapon Proficiency, All"
    ]
  end

  def mercy_desc(key)
    mercies =
      { 'Fatigued' => 'the target is no longer fatigued.',
        'Shaken'   => 'the target is no longer shaken',
        'Sickened' => 'the target is no longer sickened',
        'Dazed'    => 'the target is no longer dazed',
        'Diseased' => 'the paladin\'s lay on hands ability also acts as remove disease, using the paladin\'s level as the caster level.',
        'Staggered'=> 'the target is no longer staggered, unless the target is at exactly 0 hit points.',
        'Cursed'   => 'the paladin\'s lay on hands ability also acts as remove curse, using the paladin\'s level as the caster level.',
        'Exhausted'=> "the target is no longer exhausted. The paladin must have the fatigue mercy before selecting this mercy.",
        "Frightened" => "the target is no longer exhausted. The paladin must have the fatigue mercy before selecting this mercy.",
        "Nauseated" => "the target is no longer nauseated. The paladin must have the sickened mercy before selecting this mercy.",
        "Poisoned" => "the paladin's lay on hands ability also acts as neutralize poison, using the paladin's level as the caster level.",
        "Blinded" => "the target is no longer blinded",
        "Deafened" => "the target is no longer deafened",
        "Paralyzed" => "the target is no longer paralyzed",
        "Stunned" => "the target is no longer stunned"
      }
    return mercies[key]
  end

  def mercies(level)
    base = []
    if level >= 3
      base << [ 'Fatigued', 'Shaken', 'Sickened' ]
    end
    if level >= 6
      base << [ 'Dazed' , 'Diseased', 'Nauseated' ]
    end
    if level >= 9
      base << [ 'Cursed', 'Exhausted', 'Frightened', 'Nauseated', 'Poisoned' ]
    end
    if level >= 12
      base << [ 'Blinded', 'Deafened', 'Paralyzed', 'Stunned' ]
    end
    return base.flatten
  end

  def suggested_items
    [
      ['Longsword', 'Scale mail', 'Shield, light steel'],
      ['Greatsword', 'Scale mail']
    ]
  end
end
