class PfrpgClasses::Duelist < PfrpgClasses::Heroclass

  def name
    "Duelist"
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
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def feature_type
    'DuelistFeature'
  end

  def prerequisites
    [
      PfrpgCore::Prerequisite::BabPrereq.new(nil, 6),
      PfrpgCore::Prerequisite::SkillPrereq.new('acrobatics', 2),
      PfrpgCore::Prerequisite::SkillPrereq.new('perform', 2),
      PfrpgCore::Prerequisite::FeatPrereq.new('Dodge', nil),
      PfrpgCore::Prerequisite::FeatPrereq.new('Mobility', nil),
      PfrpgCore::Prerequisite::FeatPrereq.new('Weapon Finesse', nil),
    ]
  end

end
