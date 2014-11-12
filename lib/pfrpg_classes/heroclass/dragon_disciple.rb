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
     PfrpgSkills::Diplomacy.new,
     PfrpgSkills::EscapeArtist.new,
     PfrpgSkills::Fly.new,
     PfrpgSkills::Knowledge.new("Arcana"),
     PfrpgSkills::Knowledge.new("Dungeoneering"),
     PfrpgSkills::Knowledge.new("Local"),
     PfrpgSkills::Knowledge.new("History"),
     PfrpgSkills::Knowledge.new("Nobility"),
     PfrpgSkills::Knowledge.new("Planes"),
     PfrpgSkills::Knowledge.new("Religion"),
     PfrpgSkills::Knowledge.new("Nature"),
     PfrpgSkills::Knowledge.new("Engineering"),
     PfrpgSkills::Knowledge.new("Geography"),
     PfrpgSkills::Perception.new,
     PfrpgSkills::Spellcraft.new,
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
