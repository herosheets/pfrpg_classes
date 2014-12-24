require 'minitest/autorun'
require 'pfrpg_classes'
require 'pfrpg_utility'
require 'pfrpg_skills'
require 'pfrpg_tables'

class ClassInstantiationTest < Minitest::Test

  def test_classes
    assert PfrpgClasses::Heroclass.fetch("Rogue")
    assert PfrpgClasses::Heroclass.fetch("Cleric")
    assert PfrpgClasses::Heroclass.fetch("Druid").skills
    assert PfrpgClasses::Heroclass.fetch("Wizard")
    assert PfrpgClasses::Heroclass.fetch("Sorcerer").get_spells_table(5)
    assert PfrpgClasses::Heroclass.fetch("Fighter")
    assert PfrpgClasses::Heroclass.fetch("Ranger")
    assert PfrpgClasses::Heroclass.fetch("Monk")
    assert PfrpgClasses::Heroclass.fetch("Paladin").starting_wealth
    assert PfrpgClasses::Heroclass.fetch("Barbarian")
  end

end