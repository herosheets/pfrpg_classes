class PfrpgClasses::ArcaneArcher < PfrpgClasses::Heroclass

  def name
    "Arcane Archer"
  end

  def hit_die
    PfrpgUtility::Dice.new(1,10)
  end

  def alignment
    PfrpgUtility::Alignment.any
  end

  def description
    "Arcane archers deal death from afar, winnowing down opponents while their allies rush into hand-to-hand combat. With their capacity to unleash hails of arrows on the enemy, they represent the pinnacle of ranged combat."
  end

  def skills
    [PfrpgSkills::Skill::Perception.new,
     PfrpgSkills::Skill::Ride.new,
     PfrpgSkills::Skill::Stealth.new,
     PfrpgSkills::Skill::Survival.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::ArcaneArcher.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def prestige
    true
  end

  def feature_type
    "ArcaneArcherFeature"
  end

  def prerequisites
    [
      PfrpgUtility::Prerequisite::FeatPrereq.new('Point Blank Shot', nil),
      PfrpgUtility::Prerequisite::FeatPrereq.new('Precise Shot', nil),
      PfrpgUtility::Prerequisite::FeatPrereq.new('Weapon Focus', nil),
      PfrpgUtility::Prerequisite::BabPrereq.new(nil, 6),
      PfrpgUtility::Prerequisite::MiscPrereq.new('caster', nil)
    ]
  end

end
