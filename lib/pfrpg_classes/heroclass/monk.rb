class PfrpgClasses::Monk < PfrpgClasses::Heroclass

  def name
    "Monk"
  end

  def hit_die
    PfrpgUtility::Dice.new(1,8)
  end

  def starting_wealth
    PfrpgUtility::Dice.new(1,6, multiplier = 10)
  end

  def starting_wealth_avg
    35
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Monk.level_bonus(level)
  end

  def create_feature(f)
    MonkFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgUtility::Alignment.any_lawful
  end

  def skills_per_level
    4
  end

  def get_spells_table(level)
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def description
    "Monks excel at overcoming even the most daunting perils, striking where it's least expected, and taking advantage of enemy vulnerabilities. Fleet of foot and skilled in combat, monks can navigate any battlefield with ease, aiding allies wherever they are needed most."
  end

  def skills
    [PfrpgSkills::Skill::Acrobatics.new,
     PfrpgSkills::Skill::Climb.new,
     PfrpgSkills::Skill::Craft.new,
     PfrpgSkills::Skill::EscapeArtist.new,
     PfrpgSkills::Skill::Intimidate.new,
     PfrpgSkills::Skill::Knowledge.new("History"),
     PfrpgSkills::Skill::Knowledge.new("Religion"),
     PfrpgSkills::Skill::Perception.new,
     PfrpgSkills::Skill::Perform.new,
     PfrpgSkills::Skill::Profession.new,
     PfrpgSkills::Skill::Ride.new,
     PfrpgSkills::Skill::SenseMotive.new,
     PfrpgSkills::Skill::Stealth.new,
     PfrpgSkills::Skill::Swim.new,
    ]
  end

  def feature_type
    "MonkFeature"
  end

  def starting_feats
    ["Light Armor Proficiency", "Simple Weapon Proficiency", "Monk Weapon Proficiency"]
  end

  def unarmed_dmg(size, level)
    PfrpgTables::Tables::Heroclasses::Monk.unarmed_strike_damage(size, level)
  end

  def monk_bonus_feats(level)
    PfrpgTables::Tables::Heroclasses::Monk.monk_bonus_feats(level)
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
