class PfrpgClasses::Monk < PfrpgClasses::Heroclass

  def name
    "Monk"
  end

  def hit_die
    PfrpgCore::Dice.new(1,8)
  end

  def starting_wealth
    PfrpgCore::Dice.new(1,6, multiplier = 10)
  end

  def starting_wealth_avg
    35
  end

  def bonuses_for_level(level)
    PfrpgTables::Heroclasses::Monk.level_bonus(level)
  end

  def create_feature(f)
    MonkFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any_lawful
  end

  def skills_per_level
    4
  end

  def get_spells_table(level)
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def description
    "Monks excel at overcoming even the most daunting perils, striking where it's least expected, and taking advantage of enemy vulnerabilities. Fleet of foot and skilled in combat, monks can navigate any battlefield with ease, aiding allies wherever they are needed most."
  end

  def skills
    [PfrpgSkills::Acrobatics.new,
     PfrpgSkills::Climb.new,
     PfrpgSkills::Craft.new,
     PfrpgSkills::EscapeArtist.new,
     PfrpgSkills::Intimidate.new,
     PfrpgSkills::Knowledge.new("History"),
     PfrpgSkills::Knowledge.new("Religion"),
     PfrpgSkills::Perception.new,
     PfrpgSkills::Perform.new,
     PfrpgSkills::Profession.new,
     PfrpgSkills::Ride.new,
     PfrpgSkills::SenseMotive.new,
     PfrpgSkills::Stealth.new,
     PfrpgSkills::Swim.new,
    ]
  end

  def feature_type
    "MonkFeature"
  end

  def starting_feats
    ["Light Armor Proficiency", "Simple Weapon Proficiency", "Monk Weapon Proficiency"]
  end

  def unarmed_dmg(size, level)
    PfrpgTables::Heroclasses::Monk.unarmed_strike_damage(size, level)
  end

  def monk_bonus_feats(level)
    PfrpgTables::Heroclasses::Monk.monk_bonus_feats(level)
  end

  def get_unarmed_weapon(monk_level)
    r = Weapon.new
    r.name = 'Unarmed Strike'
    r.description = 'Unarmed Strike'
    r.dmg_s = unarmed_dmg('small', monk_level)
    r.dmg_m = unarmed_dmg('medium', monk_level)
    r.critical_range = '20'
    r.critical_dmg = '2x'
    r.weight_class = 'light'
    r.weapon_type = 'natural'
    r
  end

  def suggested_items
    [
      ['Shuriken (5)']
    ]
  end

end
