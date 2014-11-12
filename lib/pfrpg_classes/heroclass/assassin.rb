class PfrpgClasses::Assassin < PfrpgClasses::Heroclass

  def name
    "Assassin"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgCore::Dice.new(1,8)
  end

  def alignment
    PfrpgCore::Alignment.any_evil
  end

  def description
    " Assassins tend to be loners by nature, seeing companions as liabilities at best. Sometimes an assassin's missions put him in the company of adventurers for long stretches at a time, but few people are comfortable trusting a professional assassin to watch their backs in a fight, and are more likely to let the emotionless killer scout ahead or help prepare ambushes."
  end

  def skills
    [PfrpgSkills::Acrobatics.new,
     PfrpgSkills::Bluff.new,
     PfrpgSkills::Climb.new,
     PfrpgSkills::Diplomacy.new,
     PfrpgSkills::DisableDevice.new,
     PfrpgSkills::Disguise.new,
     PfrpgSkills::EscapeArtist.new,
     PfrpgSkills::Intimidate.new,
     PfrpgSkills::Linguistics.new,
     PfrpgSkills::Perception.new,
     PfrpgSkills::SenseMotive.new,
     PfrpgSkills::SleightOfHand.new,
     PfrpgSkills::Stealth.new,
     PfrpgSkills::Swim.new,
     PfrpgSkills::UseMagicDevice.new,
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Assassin.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def feature_type
    'AssassinFeature'
  end

  def prerequisites
    [
      PfrpgCore::Prerequisite::SkillPrereq.new('disguise', 2),
      PfrpgCore::Prerequisite::SkillPrereq.new('stealth', 5),
      PfrpgCore::Prerequisite::AlignmentPrereq.new(nil, 'any_evil'),
      PfrpgCore::Prerequisite::HeroclassFeaturePrereq.new('Sneak Attack', nil),
    ]
  end

end
