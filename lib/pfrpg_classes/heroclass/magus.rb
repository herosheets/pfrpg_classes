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
    PfrpgTables::Heroclasses::Wizard.level_bonus(level)
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
     PfrpgSkills::Craft.new,
     PfrpgSkills::Fly.new,
     PfrpgSkills::Linguistics.new,
     PfrpgSkills::Profession.new,
     PfrpgSkills::Spellcraft.new,
     PfrpgSkills::Knowledge.new('Arcana'),
     PfrpgSkills::Knowledge.new('Dungeoneering'),
     PfrpgSkills::Knowledge.new('Engineering'),
     PfrpgSkills::Knowledge.new('Geography'),
     PfrpgSkills::Knowledge.new('History'),
     PfrpgSkills::Knowledge.new('Local'),
     PfrpgSkills::Knowledge.new('Nature'),
     PfrpgSkills::Knowledge.new('Nobility'),
     PfrpgSkills::Knowledge.new('Planes'),
     PfrpgSkills::Knowledge.new('Religion')
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
    PfrpgTables::Heroclasses::Wizard.familiars
  end

  def bond_objects
    PfrpgTables::Heroclasses::Wizard.bond_objects
  end

  def suggested_items
    [
      ['Quarterstaff'],
      ['Dagger']
    ]
  end
end

