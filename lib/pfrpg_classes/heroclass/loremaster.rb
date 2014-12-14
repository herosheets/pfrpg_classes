class PfrpgClasses::Loremaster < PfrpgClasses::Heroclass

  def name
    "Loremaster"
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
    "Loremasters' lives are spent in study, research, and fieldwork. While the first two lend themselves to the loremaster's reputation as a bookish recluse, the latter oftentimes forces a loremaster to seek out the aid of adventurers who, through a mutually beneficial arrangement, might provide a degree of protection to the scholar while he seeks whatever knowledge he is after. For his part, the loremaster provides a wealth of information and arcane firepower to a party. Some loremasters actively deride those of their kind who fear to leave the safety of the temple or library, pointing out that only old lore can be discovered in books—new lore must be sought out in the world. These more active loremasters might join up with an adventuring party for the benefit of the journey, content with whatever knowledge might be picked up along the way."
  end

  def skills
    non_knowledge =
      [PfrpgSkills::Skill::Appraise.new,
       PfrpgSkills::Skill::Diplomacy.new,
       PfrpgSkills::Skill::HandleAnimal.new,
       PfrpgSkills::Skill::Heal.new,
       PfrpgSkills::Skill::Linguistics.new,
       PfrpgSkills::Skill::Perform.new,
       PfrpgSkills::Skill::Spellcraft.new,
       PfrpgSkills::Skill::UseMagicDevice.new,
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
    PfrpgTables::Tables::Heroclasses::Loremaster.level_bonus(level)
  end

  def get_spells_table
    # plus one of existing class
    return PfrpgTables::Tables::Spells::SpellsPerDay.empty
  end

  def skills_per_level
    4
  end

  def prerequisites
    metamagic = Proc.new do |character, attribute, value|
      character.feats.select { |x| x.feat_type == 'Metamagic' || x.feat_type == 'Item Creation' }.size >= 3
    end
    [
      PfrpgCore::Prerequisite.new(nil, nil, metamagic),
      PfrpgCore::Prerequisite::LanguagePrereq.new(nil, 'Draconic'),
      PfrpgCore::Prerequisite::MiscPrereq.new('caster level', 3)
    ]
  end

  def feature_type
    'LoremasterFeature'
  end

  def secrets_table
    [
      ['Instant Mastery', '4 ranks of a new skill', 'special', 1],
      ['Secret Health', 'Granted the Toughness feat', 'bonus_feat:toughness', 2],
      ['Secrets of inner strength', '+2 Will Save', 'saves:will:2', 3],
      ['The lore of true stamina', '+2 Fortitude Save', 'saves:fortitude:2', 4],
      ['Secret knowledge of avoidance', '+2 Reflex Save', 'saves:reflex:2', 5],
      ['Weapon trick', '+1 to attack rolls', 'combat:attack:1', 6],
      ['Dodge trick', '+1 dodge bonus to AC', 'armor:dodge:1', 7],
      ['Applicable Knowledge', 'Choose an extra feat', 'bonus_feat', 8],
      ['Newfound Arcana', 'Bonus 1st-level spell', '1stlevelspell', 9],
      ['More newfound Arcana', 'Bonus 2nd-level spell', '2ndlevelspell', 10]
    ]
  end

end
