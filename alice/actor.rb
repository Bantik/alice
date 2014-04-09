class Alice::Actor

  include Mongoid::Document
  include Mongoid::Timestamps
  include Alice::Behavior::Searchable
  include Alice::Behavior::Emotes
  include Alice::Behavior::Steals
  include Alice::Behavior::Placeable
  include Alice::Behavior::HasInventory

  field :name
  field :description
  field :last_theft, type: DateTime
  field :points
  
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many   :beverages
  has_many   :items
  belongs_to :place

  before_create :ensure_description

  def self.observer
    Alice::Actor.present.sample
  end

  def self.present
    where(place_id: Alice::Place.current.id)
  end

  def self.actions
    [
      :brew,
      :drink,
      :drop,
      :pick_pocket,
      :move,
      :talk
    ]
  end

  def ensure_description
    self.description ||= Alice::Util::Randomizer.actor_description(self.name)
  end

  def do_something
    return unless Alice::Util::Randomizer.one_chance_in(10)
    self.public_send(Alice::Actor.actions.sample)
  end

  def brew
    beverage = Alice::Beverage.make_random_for(self)
    "#{Alice::User.bot.observe_brewing(beverage.name, self.proper_name)}"
  end

  def describe
    message = ""
    message << "#{proper_name} #{self.description}. "
    message << "#{self.inventory}. "
    message << "They currently have #{self.points} points. "
    message
  end

  def drink
    return unless beverages.present?
    beverage.sample.drink
  end

  def is_bot?
    false
  end

  def proper_name
    self.name
  end

  def drop
    return unless self.items.present?
    self.items.sample.drop
  end

  def pick_pocket(attempts=0)
    if thing = (Alice::User.active | Alice::User.online).select{|user| user.items.sample}.compact.sample
      steal(thing)
    end
  end

  def move
    direction = Alice::Place.current.exits.sample
    self.place = Alice::Place.move_to(direction, false)
  end

  def talk
    "#{Alice::Util::Randomizer.says} #{Alice::Factoid.random.formatted(false)}"
  end

  def target
    (Alice::User.active | Alice::User.online).sample
  end

end