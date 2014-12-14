class PfrpgClasses::EldritchKnight < PfrpgClasses::Heroclass

  def name
    "Eldritch Knight"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgCore::Dice.new(1,10)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def description
    "Eldritch knights blend the abilities of fighting classes and spellcasters, hurling magic at the enemy one moment and hewing down their opponents with steel the next. They are just as comfortable fighting in the thick of combat as they are casting spells at foes while remaining safely behind their compatriots. Their versatility makes them valuable allies when the nature of an upcoming battle is unclear."
  end

  def feature_type
    'EldritchKnightFeature'
  end

  def skills
    [
     PfrpgSkills::Skill::Climb.new,
     PfrpgSkills::Skill::Knowledge.new('Arcana'),
     PfrpgSkills::Skill::Knowledge.new('Nobility'),
     PfrpgSkills::Skill::Linguistics.new,
     PfrpgSkills::Skill::Ride.new,
     PfrpgSkills::Skill::SenseMotive.new,
     PfrpgSkills::Skill::Spellcraft.new,
     PfrpgSkills::Skill::Swim.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::EldritchKnight.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    2
  end


  def prerequisites
    [
      PfrpgCore::Prerequisite::FeatPrereq.new('Martial Weapon Proficiency, All', nil),
      PfrpgCore::Prerequisite::MiscPrereq.new('caster level', 3)
    ]
  end

end
