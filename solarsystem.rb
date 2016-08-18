require_relative 'planet'

class SolarSystem
attr_accessor :name, :planet

  def initialize(n)
    @name = n
    @planet = []
  end

  def add_planet(planet)
    # Would be good to add verification that the planet with a given name isn't already in the solar system object
    @planet.push(planet)
  end

  # Was unable to verify if this methid is working properly.
  # Had difficulty incorporating it into my program file due to the program's complexity re: while loops and booleans for code sections
  # Tried to test this code in a separate program file I created, but got the following error running that file:
  # solar_system_program_test.rb:25:in `<main>': undefined method `distance_calc' for main:Object (NoMethodError)
  # Could not figure it out on own and tutor Sarah couldn't get back around to me again tonight.

  # def distance_calc(first_planet, second_planet)
  #   first_planet = ""
  #   second_planet = ""
  #
  #   @planet.each do |p|
  #     if p.name == first_planet
  #       first_planet = p
  #     end
  #   end
  #
  #   @planet.each do |p|
  #     if p.name == second_planet
  #       second_planet = p
  #     end
  #   end
  #
  #   #Per tutor Sarah: consider using the absolute value of two numbers Math.abs(?)
  #     distance = first_planet - second_planet
  #     distance = distance.abs
  #     return distance
  # end
end
