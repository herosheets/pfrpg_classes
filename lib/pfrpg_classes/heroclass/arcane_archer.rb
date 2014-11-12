class PfrpgClasses::ArcaneArcher < PfrpgClasses::Heroclass

  def name
    "Arcane Archer"
  end

  def hit_die
    PfrpgCore::Dice.new(1,10)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def description
    "Arcane archers deal death from afar, winnowing down opponents while their allies rush into hand-to-hand combat. With their capacity to unleash hails of arrows on the enemy, they represent the pinnacle of ranged combat."
  end

  def skills
    [PfrpgSkills::Perception.new,
     PfrpgSkills::Ride.new,
     PfrpgSkills::Stealth.new,
     PfrpgSkills::Survival.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::ArcaneArcher.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Spells::SpellsPerDay.empty
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
      PfrpgCore::Prerequisite::FeatPrereq.new('Point Blank Shot', nil),
      PfrpgCore::Prerequisite::FeatPrereq.new('Precise Shot', nil),
      PfrpgCore::Prerequisite::FeatPrereq.new('Weapon Focus', nil),
      PfrpgCore::Prerequisite::BabPrereq.new(nil, 6),
      PfrpgCore::Prerequisite::MiscPrereq.new('caster', nil)
    ]
  end

end
