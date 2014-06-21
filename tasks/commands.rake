require './alice'

namespace :commands do

  desc "Create default commands"
  task :create_defaults do

   Command.create(
      name: 'beverage',
      verbs: ["spill","pour","brew","drink","quaff","sip","swallow","gulp","down","chug","drinks","fridge", "cooler"],
      indicators: ["drinks", "beverages", "have", "what", "stocked", "which", "drink", "beverag", "stock", "provisions", "supplies"],
      stop_words: [],
      handler_class: 'Handlers::Beverage',
      response_kind: :message
    )
    Command.create(
      name: 'twitter',
      indicators: ["twitter", "handle", "nick", "who", "what", "handl"],
      stop_words: [],
      handler_class: 'Handlers::Twitter',
      response_kind: :message
    )
    Command.create(
      name: 'greeting',
      indicators: ["hi", "hello", "hey", "heya", "o/", "\\o", "greetings", "greets", "greet", "morning", "afternoon", "evening", "mornin", "morgen", "dias", "tagen", "evenin", "love", "hate", "hug"],
      stop_words: [],
      handler_class: 'Handlers::Greeting',
      response_kind: :message
    )
    Command.create(
      name: 'treasure_lister',
      indicators: ["what", "artifact", "treasure", "exist", "treasur"],
      stop_words: [],
      handler_class: 'Handlers::ItemLister',
      response_kind: :message
    )
    Command.create(
      name: 'inventory',
      indicators: ["inventory", "pockets", "purse", "satchel", "backpack", "back pack", "bag", "holding", "stuff", "carry", "inventori", "pocket", "purs", "hold", "carri", "what"],
      stop_words: [],
      handler_class: 'Handlers::Inventory',
      response_kind: :message
    )
    Command.create(
      name: 'bio',
      indicators: ["tell", "about", "something", "who", "is", "someth", "low-down", "lowdown", "ask"],
      stop_words: ["twitter", "twitters", "where", "bow"],
      handler_class: 'Handlers::Bio',
      response_kind: :message
    )
    Command.create(
      name: 'treasure_finder',
      indicators: ["find", "dungeon", "maze", "where"],
      stop_words: ["fact", "something", "about"],
      handler_class: 'Handlers::ItemFinder',
      response_kind: :message
    )
    Command.create(
      name: 'treasure_giver',
      indicators: ["give", "hand", "to", "pass", "please"],
      stop_words: [],
      handler_class: 'Handlers::ItemGiver',
      response_kind: :message
    )
    Command.create(
      name: 'oh',
      indicators: ["what", "heard", "ohohs", "word", "saying", "talking", "ohoh", "say", "talk", "hear", "up", "going on", "overheard", "OH"],
      stop_words: [],
      handler_class: 'Handlers::Oh',
      response_kind: :message
    )
    Command.create(
      name: 'factoid',
      indicators: ["tell", "something", "fact", "about", "random", "suprising", "hearing", "the word", "the lowdown", "the low-down"],
      stop_words: [],
      handler_class: 'Handlers::Factoid',
      response_kind: :message
    )
  end

end