require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
    #new_fish << self
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].map do |dog_obj|
      dog_obj.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].collect do |cat_obj|
      cat_obj.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].collect do |fish_obj|
      fish_obj.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |pet_catagory, pet_array|
      pet_array.each do | indv_pet |
        indv_pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    #{}"I have 2 fish, 3 dog(s), and 1 cat(s)."

    fish_count = @pets[:fishes].count
    dog_count = @pets[:dogs].count
    cat_count = @pets[:cats].count
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end
