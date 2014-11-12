class PfrpgClasses::Druid < PfrpgClasses::Heroclass

  def name
    "Druid"
  end

  def hit_die
    PfrpgCore::Dice.new(1,8)
  end

  def starting_wealth
    PfrpgCore::Dice.new(2,6, multiplier = 10)
  end

  def starting_wealth_avg
    70
  end

  def bonuses_for_level(level)
    PfrpgTables::Tables::Heroclasses::Druid.level_bonus(level)
  end

  def create_feature(f)
    DruidFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any_neutral #???
  end

  def skills_per_level
    4
  end

  def get_spells_table(level)
    return PfrpgTables::Spells::SpellsPerDay.Druid(level)
  end

  def spells_bonus_attr
    "wis"
  end

  def description
    "While some druids might keep to the fringe of battle, allowing companions and summoned creatures to fight while they confound foes with the powers of nature, others transform into deadly beasts and savagely wade into combat. Druids worship personifications of elemental forces, natural powers, or nature itself. Typically this means devotion to a nature deity, though druids are just as likely to revere vague spirits, animalistic demigods, or even specific awe-inspiring natural wonders."
  end

  def skills
    [PfrpgSkills::Climb.new,
     PfrpgSkills::Craft.new,
     PfrpgSkills::Fly.new,
     PfrpgSkills::HandleAnimal.new,
     PfrpgSkills::Heal.new,
     PfrpgSkills::Knowledge.new("Geography"),
     PfrpgSkills::Knowledge.new("Nature"),
     PfrpgSkills::Perception.new,
     PfrpgSkills::Profession.new,
     PfrpgSkills::Ride.new,
     PfrpgSkills::Spellcraft.new,
     PfrpgSkills::Survival.new,
     PfrpgSkills::Swim.new,
    ]
  end

  def feature_type
    "DruidFeature"
  end

  def starting_feats
    [
      "Druid Weapon Proficiency",
      "Light Armor Proficiency",
      "Medium Armor Proficiency",
      "Shield Proficiency"
    ]
  end

  def animal_companions
    [
      'Allosaurus',
      'Ankylosaurus',
      'Ant, giant',
      'Antelope',
      'Ape',
      'Archelon',
      'Arsinoitherium',
      'Aurochs',
      'Axe beak',
      'Baboon',
      'Badger',
      'Baluchitherium',
      'Basilosaurus',
      'Bat, dire',
      'Bear',
      'Beetle, giant',
      'Bird',
      'Boar',
      'Brachiosaurus',
      'Camel',
      'Cat, big',
      'Cat, Small1',
      'Centipede, giant',
      'Chameleon, giant',
      'Crab, Giant',
      'Crocodile',
      'Deinonychus',
      'Dimetrodon',
      'Dimorphodon',
      'Dog',
      'Dolphin',
      'Eel, electric',
      'Elasmosaurus',
      'Elephant',
      'Elk',
      'Frog, giant',
      'Gar',
      'Gecko, giant',
      'Goblin dog',
      'Glyptodon',
      'Hippopotamus',
      'Horse',
      'Hyena',
      'Iguanodon',
      'Kangaroo',
      'Llama',
      'Leech, giant',
      'Manta ray',
      'Mantis, giant',
      'Megalania',
      'Megaloceros',
      'Megatherium',
      'Monitor lizard',
      'Moose',
      'Moray eel, giant',
      'Octopus',
      'Orca',
      'Pachycephalosaurus',
      'Panda',
      'Parasaurolophus',
      'Pony',
      'Pteranodon',
      'Quetzalcoatlus',
      'Ram',
      'Rat, dire',
      'Rhinoceros',
      'Roc',
      'Scorpion, giant',
      'Shark1',
      'Slug, giant',
      'Snake, constrictor',
      'Snake, viper',
      'Snapping turtle',
      'Spider, giant',
      'Spinosaurus',
      'Squid',
      'Stegosaurus',
      'Stingray',
      'Thylacine',
      'Toad, giant',
      'Triceratops',
      'Tylosaurus',
      'Tyrannosaurus',
      'Vulture, giant',
      'Walrus',
      'Wasp, giant',
      'Wolf',
    ]
  end

  def suggested_items
    [
      ['Club', 'Leather', 'Buckler'],
      ['Quarterstaff', 'Leather']
    ]
  end
end
