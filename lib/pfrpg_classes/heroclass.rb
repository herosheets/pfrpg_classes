module PfrpgClasses
  class PfrpgClasses::Heroclass

    attr_reader :level_for_json
    def initialize(level_for_json=1)
      @level_for_json = level_for_json
      @level_for_json -= 1 if (level_for_json > 20 || (prestige && level_for_json > 10))
    end

    # deprecated
    def self.by_name(name)
      self.fetch(name)
    end

    def self.fetch(name)
      c = class_list.find { |x| x.name == name }
      unless c
        c = prestige_class_list.find { |x| x.name == name }
      end
      return c
    end

    def self.class_list(level=1)
      [
       Barbarian.new(level),
       Bard.new(level),
       Cleric.new(level),
       Druid.new(level),
       Fighter.new(level),
       Monk.new(level),
       Paladin.new(level),
       Ranger.new(level),
       Rogue.new(level),
       Sorcerer.new(level),
       Wizard.new(level)
      ]
    end

    def self.prestige_class_list(level=1)
      [
        ArcaneArcher.new(level),
        ArcaneTrickster.new(level),
        Assassin.new(level),
        Duelist.new(level),
        DragonDisciple.new(level),
        EldritchKnight.new(level),
        Loremaster.new(level),
        MysticTheurge.new(level),
        PathfinderChronicler.new(level),
        Shadowdancer.new(level),
      ]
    end

    def starting_wealth_str
      "#{starting_wealth.to_s} (#{starting_wealth_avg}gp average)"
    end

    def self.class_list_json
      self.class_list.map { |x| x.as_json }
    end

    def self.prestige_list_json
      self.prestige_class_list.map { |x| x.as_json }
    end

    def as_json(options={})
      { :description => description,
        :skills => skills.map { |x| x.to_s },
        :skills_per_level => skills_per_level,
        :heroclass_name => name,
        :alignment => alignment,
        :starting_wealth => starting_wealth_str,
        :hit_die => hit_die.to_s,
        :bab => bab,
        :saves => saves,
        :features => features,
        :spells => spells,
        :current_level => (@level_for_json - 1)
      }
    end

    def bab
      bonuses_for_level(level_for_json)[:base_attack_bonus]
    end

    def saves
      b = bonuses_for_level(level_for_json)
      return "Fort: +#{b[:fort_save]}, Ref: +#{b[:ref_save]}, Will: +#{b[:will_save]}"
    end

    def spells
      begin
        get_spells_table(level_for_json)
      rescue Exception => e
        return "None"
      end
    end

    def features
      f = bonus_features_for_level(level_for_json) || []
      c = bonus_choices_for_level(level_for_json) || []
      pretty = []
      f.each do |feature|
        pretty << pretty_feature_string(feature)
      end
      c.each do |choice|
        pretty << pretty_choice_string(choice)
      end
      pretty
    end

    def pretty_feature_string(feature)
      string = ""
      feature.split("_").each do |s|
        string += s.capitalize + " "
      end
      return string
    end

    def pretty_choice_string(choice)
      string = ""
      c = choice.class.name.split /(?=[A-Z])/
      return c.join(" ")
    end

    def starting_feats
      []
    end

    def starting_wealth
      0
    end

    def starting_wealth_avg
      0
    end

    def spells_per_day(char_level)
        get_spells_table(char_level)
    end

    def bonus_choices_for_level(level)
      bonuses_for_level(level)[:choices]
    end

    def bonus_features_for_level(level)
      bonuses_for_level(level)[:granted_features]
    end

    def prestige
      false
    end

    def meets_prerequisites?(c)
      return true unless prestige
      prerequisites.each do |x|
        #ap "Looking for :"
        #ap x
        #ap "Match? #{x.match(c)}"
        return false unless x.match(c)
      end
      return true
    end
  end
end
