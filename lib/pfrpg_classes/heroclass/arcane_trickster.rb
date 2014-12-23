class PfrpgClasses::ArcaneTrickster < PfrpgClasses::Heroclass

  def name
    "Arcane Trickster"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgUtility::Dice.new(1,6)
  end

  def alignment
    PfrpgUtility::Alignment.never_lawful
  end

  def description
    "With their mastery of magic, arcane tricksters can make for even more subtle or confounding opponents than standard rogues. Ranged legerdemain enhances their skill as thieves, and their ability to make sneak attacks without flanking or as part of a spell can make arcane tricksters formidable damage-dealers."
  end

  def skills
    [PfrpgSkills::Skill::Acrobatics.new,
     PfrpgSkills::Skill::Appraise.new,
     PfrpgSkills::Skill::Bluff.new,
     PfrpgSkills::Skill::Climb.new,
     PfrpgSkills::Skill::Diplomacy.new,
     PfrpgSkills::Skill::DisableDevice.new,
     PfrpgSkills::Skill::Disguise.new,
     PfrpgSkills::Skill::EscapeArtist.new,
     PfrpgSkills::Skill::Knowledge.new("Arcana"),
     PfrpgSkills::Skill::Perception.new,
     PfrpgSkills::Skill::SenseMotive.new,
     PfrpgSkills::Skill::SleightOfHand.new,
     PfrpgSkills::Skill::Spellcraft.new,
     PfrpgSkills::Skill::Stealth.new,
     PfrpgSkills::Skill::Swim.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::ArcaneTrickster.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def prerequisite_skills
    [PfrpgSkills::DisableDevice.new, # 4 ranks
     PfrpgSkills::Skill::EscapeArtist.new, # 4 ranks
     PfrpgSkills::Skill::Knowledge.new('Arcana') # 4 ranks
    ]
  end

  def prerequisites
    [
      PfrpgUtility::Prerequisite::SkillPrereq.new('disable_device', 4),
      PfrpgUtility::Prerequisite::SkillPrereq.new('escape_artist', 4),
      PfrpgUtility::Prerequisite::SkillPrereq.new('knowledge : Arcana', 4),
      PfrpgUtility::Prerequisite::AlignmentPrereq.new(nil, 'never_lawful'),
      PfrpgUtility::Prerequisite::HeroclassFeaturePrereq.new('Sneak Attack', nil),
      PfrpgUtility::Prerequisite::MiscPrereq.new('caster', nil)
    ]
  end

  def feature_type
    "ArcaneTricksterFeature"
  end

end
