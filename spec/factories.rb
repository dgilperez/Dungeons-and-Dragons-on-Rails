FactoryGirl.define do
  sequence :name do |n|
    "name #{n}"
  end

  factory :character do
    name
    level 2
    alignment "good"
    size "small"
    health_points 3
    armor_class 15
    speed 3
    languages ["Common", "Deep Speech"]
    senses ["Low-light vision"]

    factory :npc, :class => NonPlayerCharacter do
      character_roles ["Brute"]
      xp_value 10
    end

    factory :player, :class => PlayerCharacter do
      character_class_code "Fighter"
    end
  end

  factory :encounter do
    name "An Encouter"
    after_build {|enc|
      npcs = FactoryGirl.create_list(:npc, 3)
      npcs.each {|n| enc.npc_counts[n.id.to_s] = 3}
    }
  end

  factory :insider_datum do
    sequence(:original_id)
    data_type ["monster", "class", "power"]
    html "<p>Name of this thing</p><p>and some details too</p>"
    ravenloft_version Ravenloft::VERSION
  end
end
