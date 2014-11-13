class PfrpgClasses::Ranger < PfrpgClasses::Heroclass

  def name
    "Ranger"
  end

  def hit_die
    PfrpgCore::Dice.new(1,10)
  end

  def starting_wealth
    PfrpgCore::Dice.new(5,6, multiplier = 10)
  end

  def starting_wealth_avg
    175
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Ranger.level_bonus(level)
  end

  def create_feature(f)
    RangerFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def skills_per_level
    6
  end

  def get_spells_table(level)
    return PfrpgTables::Spells::SpellsPerDay.Ranger(level)
  end

  def spells_bonus_attr
    "wis"
  end

  def description
    "Ranger are deft skirmishers, either in melee or at range, capable of skillfully dancing in and out of battle. Their abilities allow them to deal significant harm to specific types of foes, but their skills are valuable against all manner of enemies."
  end

  def skills
    [PfrpgSkill::Skill::Climb.new,
     PfrpgSkill::Skill::Craft.new,
     PfrpgSkill::Skill::HandleAnimal.new,
     PfrpgSkill::Skill::Heal.new,
     PfrpgSkill::Skill::Intimidate.new,
     PfrpgSkill::Skill::Knowledge.new("Dungeoneering"),
     PfrpgSkill::Skill::Knowledge.new("Geography"),
     PfrpgSkill::Skill::Knowledge.new("Nature"),
     PfrpgSkill::Skill::Perception.new,
     PfrpgSkill::Skill::Profession.new,
     PfrpgSkill::Skill::Ride.new,
     PfrpgSkill::Skill::Spellcraft.new,
     PfrpgSkill::Skill::Stealth.new,
     PfrpgSkill::Skill::Survival.new,
     PfrpgSkill::Skill::Swim.new,
    ]
  end

  def feature_type
    "RangerFeature"
  end

  def starting_feats
    [
      "Light Armor Proficiency",
      "Medium Armor Proficiency",
      "Simple Weapon Proficiency",
      "Martial Weapon Proficiency, All"
    ]
  end

  def favored_enemies
    PfrpgTables::Tables::Heroclasses::Ranger.favored_enemies
  end

  def animals
    PfrpgTables::Tables::Heroclasses::Ranger.animals
  end

  def combat_style_feats(level)
    PfrpgTables::Tables::Heroclasses::Ranger.combat_style_feats(level)
  end

  def suggested_items
    [
      ['Sword, short', 'Sword, short', 'Leather'],
      ['Longbow', 'Leather', 'Arrow(s), common (20)']
    ]
  end
end
