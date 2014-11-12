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
      [PfrpgSkills::Appraise.new,
       PfrpgSkills::Bluff.new,
       PfrpgSkills::Diplomacy.new,
       PfrpgSkills::Disguise.new,
       PfrpgSkills::EscapeArtist.new,
       PfrpgSkills::Intimidate.new,
       PfrpgSkills::Linguistics.new,
       PfrpgSkills::Perception.new,
       PfrpgSkills::Perform.new,
       PfrpgSkills::Ride.new,
       PfrpgSkills::SenseMotive.new,
       PfrpgSkills::SleightOfHand.new,
       PfrpgSkills::Survival.new,
       PfrpgSkills::UseMagicDevice.new
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
      non_knowledge <<PfrpgSkills::Knowledge.new(k)
    end
    return non_knowledge
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::PathfinderChronicler.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Spells::SpellsPerDay.empty
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
