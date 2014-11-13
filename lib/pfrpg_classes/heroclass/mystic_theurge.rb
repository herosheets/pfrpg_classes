class PfrpgClasses::MysticTheurge < PfrpgClasses::Heroclass

  def name
    "Mystic Theurge"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgCore::Dice.new(1,6)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def description
    " The mystic theurge is a powerful component for any party, supplying magic for attack, defense, and healing. Mystic theurges travel the world in search of arcane and holy artifacts, magical lore, or divine revelations, and most have no qualms about teaming up with groups of adventurers so long as that group's goals do not directly conflict with their own."
  end

  def skills
    [PfrpgSkills::Skill::Knowledge.new("Arcana"),
     PfrpgSkills::Skill::Knowledge.new("Religion"),
     PfrpgSkills::Skill::SenseMotive.new,
     PfrpgSkills::Skill::Spellcraft.new,
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::MysticTheurge.level_bonus(level)
  end

  def get_spells_table
    # this is complicated for mystic theurge
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    2
  end

  def feature_type
    'MysticTheurgeFeature'
  end

  def prerequisites
    [
      PfrpgCore::Prerequisite::SkillPrereq.new('knowledge : arcana', 3),
      PfrpgCore::Prerequisite::SkillPrereq.new('knowledge : religion', 3),
      PfrpgCore::Prerequisite::MiscPrereq.new('divine', nil),
      PfrpgCore::Prerequisite::MiscPrereq.new('caster', nil),
      PfrpgCore::Prerequisite::MiscPrereq.new('caster level', 2)
    ]
  end

end
