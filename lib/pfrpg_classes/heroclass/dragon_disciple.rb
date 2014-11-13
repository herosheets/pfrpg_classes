class PfrpgClasses::DragonDisciple < PfrpgClasses::Heroclass

  def name
    "Dragon Disciple"
  end

  def prestige
    true
  end

  def hit_die
    PfrpgCore::Dice.new(1,12)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def description
    "With the magic of a spellcasting class at their disposal, dragon disciples can assume the typical role of a magic-user, hampering the movement of the enemy and hurling damage-dealing spells at their opponents. Dragon disciples' draconic abilities, however, make these versatile spellcasters even more formidable, as they use their breath weapons and flight to destroy their foes directly."
  end

  def skills
    [
     PfrpgSkills::Skill::Diplomacy.new,
     PfrpgSkills::Skill::EscapeArtist.new,
     PfrpgSkills::Skill::Fly.new,
     PfrpgSkills::Skill::Knowledge.new("Arcana"),
     PfrpgSkills::Skill::Knowledge.new("Dungeoneering"),
     PfrpgSkills::Skill::Knowledge.new("Local"),
     PfrpgSkills::Skill::Knowledge.new("History"),
     PfrpgSkills::Skill::Knowledge.new("Nobility"),
     PfrpgSkills::Skill::Knowledge.new("Planes"),
     PfrpgSkills::Skill::Knowledge.new("Religion"),
     PfrpgSkills::Skill::Knowledge.new("Nature"),
     PfrpgSkills::Skill::Knowledge.new("Engineering"),
     PfrpgSkills::Skill::Knowledge.new("Geography"),
     PfrpgSkills::Skill::Perception.new,
     PfrpgSkills::Skill::Spellcraft.new,
    ]
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::DragonDisciple.level_bonus(level)
  end

  def get_spells_table
    return PfrpgTables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    2
  end

  def feature_type
    'DragonDiscipleFeature'
  end

  def prerequisites
    [
      PfrpgCore::Prerequisite::SkillPrereq.new('knowledge : arcana', 4),
      PfrpgCore::Prerequisite::LanguagePrereq.new(nil, 'Draconic'),
      PfrpgCore::Prerequisite::MiscPrereq.new('caster', nil)
    ]
  end
end
