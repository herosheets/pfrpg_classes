class PfrpgClasses::Assassin < PfrpgClasses::Heroclass

  def name
    "Assassin"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgUtility::Dice.new(1,8)
  end

  def alignment
    PfrpgUtility::Alignment.any_evil
  end

  def description
    " Assassins tend to be loners by nature, seeing companions as liabilities at best. Sometimes an assassin's missions put him in the company of adventurers for long stretches at a time, but few people are comfortable trusting a professional assassin to watch their backs in a fight, and are more likely to let the emotionless killer scout ahead or help prepare ambushes."
  end

  def skills
    [PfrpgSkills::Skill::Acrobatics.new,
     PfrpgSkills::Skill::Bluff.new,
     PfrpgSkills::Skill::Climb.new,
     PfrpgSkills::Skill::Diplomacy.new,
     PfrpgSkills::Skill::DisableDevice.new,
     PfrpgSkills::Skill::Disguise.new,
     PfrpgSkills::Skill::EscapeArtist.new,
     PfrpgSkills::Skill::Intimidate.new,
     PfrpgSkills::Skill::Linguistics.new,
     PfrpgSkills::Skill::Perception.new,
     PfrpgSkills::Skill::SenseMotive.new,
     PfrpgSkills::Skill::SleightOfHand.new,
     PfrpgSkills::Skill::Stealth.new,
     PfrpgSkills::Skill::Swim.new,
     PfrpgSkills::Skill::UseMagicDevice.new,
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Assassin.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def feature_type
    'AssassinFeature'
  end

  def prerequisites
    [
      PfrpgUtility::Prerequisite::SkillPrereq.new('disguise', 2),
      PfrpgUtility::Prerequisite::SkillPrereq.new('stealth', 5),
      PfrpgUtility::Prerequisite::AlignmentPrereq.new(nil, 'any_evil'),
      PfrpgUtility::Prerequisite::HeroclassFeaturePrereq.new('Sneak Attack', nil),
    ]
  end

end
