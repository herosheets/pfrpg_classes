class PfrpgClasses::Duelist < PfrpgClasses::Heroclass

  def name
    "Duelist"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgUtility::Dice.new(1,10)
  end

  def alignment
    PfrpgUtility::Alignment.any
  end

  def description
    "The abilities of duelists complement those rogues or bards who wish to accentuate their fighting prowess but, because of their lack of heavy armor, are afraid to leap into combat. Duelists fight in the forefront alongside fighters, barbarians, and other melee combatants, deftly avoiding the blades of their opponents while expertly targeting their vulnerabilities."
  end

  def skills
    [PfrpgSkills::Skill::Acrobatics.new,
     PfrpgSkills::Skill::Bluff.new,
     PfrpgSkills::Skill::EscapeArtist.new,
     PfrpgSkills::Skill::Perception.new,
     PfrpgSkills::Skill::Perform.new,
     PfrpgSkills::Skill::SenseMotive.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Duelist.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def feature_type
    'DuelistFeature'
  end

  def prerequisites
    [
      PfrpgUtility::Prerequisite::BabPrereq.new(nil, 6),
      PfrpgUtility::Prerequisite::SkillPrereq.new('acrobatics', 2),
      PfrpgUtility::Prerequisite::SkillPrereq.new('perform', 2),
      PfrpgUtility::Prerequisite::FeatPrereq.new('Dodge', nil),
      PfrpgUtility::Prerequisite::FeatPrereq.new('Mobility', nil),
      PfrpgUtility::Prerequisite::FeatPrereq.new('Weapon Finesse', nil),
    ]
  end

end
