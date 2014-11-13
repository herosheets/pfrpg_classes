class PfrpgClasses::Wizard < PfrpgClasses::Heroclass

  def name
    "Wizard"
  end

  def hit_die
    PfrpgCore::Dice.new(1,6)
  end

  def starting_wealth
    PfrpgCore::Dice.new(2,6, multiplier = 10)
  end

  def starting_wealth_avg
    70
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Wizard.level_bonus(level)
  end

  def create_feature(f)
    WizardFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def skills_per_level
    2
  end

  def get_spells_table(level)
    return PfrpgTables::Spells::SpellsPerDay.Wizard(level)
  end

  def description
    "While universalist wizards might study to prepare themselves for any manner of danger, specialist wizards research schools of magic that make them exceptionally skilled within a specific focus. Yet no matter their specialty, all wizards are masters of the impossible and can aid their allies in overcoming any danger."
  end

  def spells_bonus_attr
    "int"
  end

  def skills
    [PfrpgSkills::Appraise.new,
     PfrpgSkills::Skill::Craft.new,
     PfrpgSkills::Skill::Fly.new,
     PfrpgSkills::Skill::Linguistics.new,
     PfrpgSkills::Skill::Profession.new,
     PfrpgSkills::Skill::Spellcraft.new,
     PfrpgSkills::Skill::Knowledge.new('Arcana'),
     PfrpgSkills::Skill::Knowledge.new('Dungeoneering'),
     PfrpgSkills::Skill::Knowledge.new('Engineering'),
     PfrpgSkills::Skill::Knowledge.new('Geography'),
     PfrpgSkills::Skill::Knowledge.new('History'),
     PfrpgSkills::Skill::Knowledge.new('Local'),
     PfrpgSkills::Skill::Knowledge.new('Nature'),
     PfrpgSkills::Skill::Knowledge.new('Nobility'),
     PfrpgSkills::Skill::Knowledge.new('Planes'),
     PfrpgSkills::Skill::Knowledge.new('Religion')
    ]
  end

  def feature_type
    "WizardFeature"
  end

  def starting_feats
    [
      "Wizard Weapon Proficiency"
    ]
  end

  def familiars
    PfrpgTables::Tables::Heroclasses::Wizard.familiars
  end

  def bond_objects
    PfrpgTables::Tables::Heroclasses::Wizard.bond_objects
  end

  def suggested_items
    [
      ['Quarterstaff'],
      ['Dagger']
    ]
  end
end

