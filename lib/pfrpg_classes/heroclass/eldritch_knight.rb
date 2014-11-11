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
     PfrpgSkills::Climb.new,
     PfrpgSkills::Knowledge.new('Arcana'),
     PfrpgSkills::Knowledge.new('Nobility'),
     PfrpgSkills::Linguistics.new,
     PfrpgSkills::Ride.new,
     PfrpgSkills::SenseMotive.new,
     PfrpgSkills::Spellcraft.new,
     PfrpgSkills::Swim.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Heroclasses::EldritchKnight.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Spells::SpellsPerDay.empty
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
