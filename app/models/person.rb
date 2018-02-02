class Person < ApplicationRecord
  belongs_to :race

  def greet
    puts "Hello, I'm " + self.name;
  end

  def self.describe(p)
    if p.race_id == 1
      p.name + " is a Human"
    else
      p.name + " is a Zombie"
    end
  end

  def talk(p)
    if p.race_id == 1
      "Pleasure to make your acquaintance, " + p.name + "!"
    else
      "ERRRRrrrrrrgggggghhuuuuuuuugh"
    end
  end

  def bite(p)
    if ((self.race_id==1) and (p.race_id == 1))
      "Humans don't bite other people!"
    elsif ((self.race_id == 2) and (p.race_id == 2))
      "Zombies don't bite other zombies"
    elsif ((self.race_id == 1) and (p.race_id == 2))
      "Humans kill Zombies"
    else
      p.update(:race_id => 2)
      self.name + " just bit " + p.name
    end
  end

  def setName(name)
    self.name = name;
  end

end
