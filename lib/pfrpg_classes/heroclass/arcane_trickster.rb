class PfrpgClasses::ArcaneTrickster < PfrpgClasses::Heroclass

  def name
    "Arcane Trickster"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgCore::Dice.new(1,6)
  end

  def alignment
    PfrpgCore::Alignment.never_lawful
  end

  def description
    "With their mastery of magic, arcane tricksters can make for even more subtle or confounding opponents than standard rogues. Ranged legerdemain enhances their skill as thieves, and their ability to make sneak attacks without flanking or as part of a spell can make arcane tricksters formidable damage-dealers."
  end

  def skills
    [PfrpgSkills::Acrobatics.new,
     PfrpgSkills::Appraise.new,
     PfrpgSkills::Bluff.new,
     PfrpgSkills::Climb.new,
     PfrpgSkills::Diplomacy.new,
     PfrpgSkills::DisableDevice.new,
     PfrpgSkills::Disguise.new,
     PfrpgSkills::EscapeArtist.new,
     PfrpgSkills::Knowledge.new("Arcana"),
     PfrpgSkills::Perception.new,
     PfrpgSkills::SenseMotive.new,
     PfrpgSkills::SleightOfHand.new,
     PfrpgSkills::Spellcraft.new,
     PfrpgSkills::Stealth.new,
     PfrpgSkills::Swim.new
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Heroclasses::ArcaneTrickster.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def prerequisite_skills
    [PfrpgSkills::DisableDevice.new, # 4 ranks
     PfrpgSkills::EscapeArtist.new, # 4 ranks
     PfrpgSkills::Knowledge.new('Arcana') # 4 ranks
    ]
  end

  def prerequisites
    [
      PfrpgCore::Prerequisite::SkillPrereq.new('disable_device', 4),
      PfrpgCore::Prerequisite::SkillPrereq.new('escape_artist', 4),
      PfrpgCore::Prerequisite::SkillPrereq.new('knowledge : Arcana', 4),
      PfrpgCore::Prerequisite::AlignmentPrereq.new(nil, 'never_lawful'),
      PfrpgCore::Prerequisite::HeroclassFeaturePrereq.new('Sneak Attack', nil),
      PfrpgCore::Prerequisite::MiscPrereq.new('caster', nil)
    ]
  end

  def feature_type
    "ArcaneTricksterFeature"
  end

end
