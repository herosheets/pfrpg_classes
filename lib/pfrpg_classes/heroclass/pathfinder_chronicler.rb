class PfrpgClasses::PathfinderChronicler < PfrpgClasses::Heroclass

  def name
    "Pathfinder Chronicler"
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
    "The Pathfinder chronicler's missions often thrust her into the role of party leader, and adventures typically result from, and revolve around, his endless quests."
  end

  def skills
    non_knowledge =
      [PfrpgSkills::Skill::Appraise.new,
       PfrpgSkills::Skill::Bluff.new,
       PfrpgSkills::Skill::Diplomacy.new,
       PfrpgSkills::Skill::Disguise.new,
       PfrpgSkills::Skill::EscapeArtist.new,
       PfrpgSkills::Skill::Intimidate.new,
       PfrpgSkills::Skill::Linguistics.new,
       PfrpgSkills::Skill::Perception.new,
       PfrpgSkills::Skill::Perform.new,
       PfrpgSkills::Skill::Ride.new,
       PfrpgSkills::Skill::SenseMotive.new,
       PfrpgSkills::Skill::SleightOfHand.new,
       PfrpgSkills::Skill::Survival.new,
       PfrpgSkills::Skill::UseMagicDevice.new
      ]
    knowledge =
      [ 'Arcana',
        'Dungeoneering',
        'Engineering',
        'Geography',
        'History',
        'Local',
        'Nature',
        'Nobility',
        'Planes',
        'Religion'
      ]
    knowledge.each do |k|
      non_knowledge << PfrpgSkills::Skill::Knowledge.new(k)
    end
    return non_knowledge
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::PathfinderChronicler.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def feature_type
    'PathfinderChroniclerFeature'
  end

  def prerequisites
    [
      PfrpgCore::Prerequisite::SkillPrereq.new('linguistics', 3),
      PfrpgCore::Prerequisite::SkillPrereq.new('perform', 5),
      PfrpgCore::Prerequisite::SkillPrereq.new('profession', 5),
    ]
  end

end
