class PfrpgClasses::Shadowdancer < PfrpgClasses::Heroclass

  def name
    "Shadowdancer"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgCore::Dice.new(1,8)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def description
    "Shadowdancers adventure for a wide variety of reasons. Many adventuring parties find shadowdancers valuable members of their teams due to their incredible stealth and ability to surprise enemies with lightning-quick attacks where they're least expected. For this reason, their services are often sought out by those groups in need of scouts or spies."
  end

  def skills
    [PfrpgSkills::Acrobatics.new,
     PfrpgSkills::Bluff.new,
     PfrpgSkills::Diplomacy.new,
     PfrpgSkills::Disguise.new,
     PfrpgSkills::EscapeArtist.new,
     PfrpgSkills::Perception.new,
     PfrpgSkills::Perform.new,
     PfrpgSkills::SleightOfHand.new,
     PfrpgSkills::Stealth.new,
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Shadowdancer.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    6
  end

  def feature_type
    'ShadowdancerFeature'
  end

  def prerequisites
    [
      PfrpgCore::Prerequisite::SkillPrereq.new('stealth', 5),
      PfrpgCore::Prerequisite::SkillPrereq.new('perform', 2),
      PfrpgCore::Prerequisite::FeatPrereq.new('Combat Reflexes', nil),
      PfrpgCore::Prerequisite::FeatPrereq.new('Dodge', nil),
      PfrpgCore::Prerequisite::FeatPrereq.new('Mobility', nil),
    ]
  end

end
