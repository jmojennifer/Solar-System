require_relative "planet"
require_relative "solarsystem"
require "colorize"



# Array format leftover from Wave 1 Optional Enhancement instructions; not updated to populate via the SolarSystem class
our_solar_system_list = [
           # name, rings, moons, atmospheric_makeup, mass, rate_of_rotation, distance_from_sun
Planet.new("Mercury", 5, 2, "Blueberry gas", "40lb", 5, 1),
Planet.new("Venus", 0, 1, "Lemon gas", "100lb", 3, 2),
Planet.new("Earth", 3, 1, "Cherry gas", "150lb", 2, 3),
Planet.new("Secret Earth", 10, 20, "Squiggle gas", "4000lb", 10, 15),
Planet.new("Mars", 2, 2, "Strawberry gas", "125lb", 5, 4),
Planet.new("Jupiter", 1, 3, "Orange gas", "500lb", 4, 5),
Planet.new("Saturn", 7, 4, "Grape gas", "200lb", 5, 6),
Planet.new("Uranus", 1, 2, "Peach gas", "300lb", 2, 7),
Planet.new("Neptune", 2, 5, "Blackberry gas", "300lb", 6, 8),
Planet.new("Pluto", 0, 2, "Razzleberry gas", "100lb", 4, 9)

]

# Made this into a definition to be able to use the menus in various places.
def planet_list
  puts "\n1: Mercury, 2: Venus, 3: Earth, 4: Secret Earth, 5: Mars, 6: Jupiter, 7: Saturn, 8: Uranus, 9: Neptune, 10: Pluto".colorize(:yellow)
  puts "\n11: Exits our solar system (so you can start making your own solar systems and planets!)".colorize(:yellow)
  puts "\n(At this time, you are unable to return to our solar system's information after exiting.)".colorize(:yellow)
end

puts "\n\nWhat planet in our solar system would you like to learn about?".colorize(:yellow)
planet_list
user_choice_planet = gets.chomp

until user_choice_planet.match(/\d/)
  puts "\nI don't recognize that input. Please enter the number of the planet you want to learn about.".colorize(:yellow)
  planet_list
  user_choice_planet = gets.chomp
end

information_session = true
ss_creation_session = true
ss_p_creation_session = true
# data_compare_session = true

# used boolean toggles throughout the program to let the user select as many actions in a section of code as possible
while information_session == true

  if user_choice_planet.to_i != 11 && user_choice_planet.to_i > 0 && user_choice_planet.to_i < 12
    user_choice_planet = user_choice_planet.to_i
    puts "\n\n#{ our_solar_system_list[user_choice_planet - 1].name } is a planet with the following features:\n\n"
    puts "Number of rings: #{ our_solar_system_list[user_choice_planet - 1].rings }"
    puts "Number of moons: #{ our_solar_system_list[user_choice_planet - 1].moons }"
    puts "Its atmospheric makeup is #{ our_solar_system_list[user_choice_planet - 1].atmospheric_makeup }"
    puts "Its mass is #{ our_solar_system_list[user_choice_planet - 1].mass }"
    puts "Its rate of rotation is #{ our_solar_system_list[user_choice_planet - 1].rate_of_rotation }"
    puts "Its distance from the sun is #{ our_solar_system_list[user_choice_planet - 1].distance_from_sun }"
    puts "\n\nWould you like to learn about another planet? If so, enter its number."
    planet_list
    user_choice_planet = gets.chomp

  elsif user_choice_planet.to_i == 11
    information_session = false

  else
    puts "\n\nThat's not a valid planet selection. Please enter one of the listed planet's numbers.".colorize(:yellow)
    planet_list
    user_choice_planet = gets.chomp
  end
end

while ss_creation_session == true
  puts "\n\nWould you like to make a new solar system? (Yes or No)".colorize(:yellow)
  user_choice_ss_creation = gets.chomp

  # I'll consider what Shari's program does as a better option in the future: using [k, v].transpose.to_h to merge two arrays into a hash
  # Outer case statement related to creation of new solar systems
  case user_choice_ss_creation
  when "Y", "Yes", "y", "yes"
    planet_count = 0
    # It may not be necessary to assign ss_creation_session to true here, but I'd thought there was a program flow scenario requiring it
    ss_creation_session = true
    # I know for sure that it's necessary to assign ss_p_creation_session to true here, to allow the user to assign planets to a more than one solar system
    ss_p_creation_session = true
    puts "\nWhat would you like to name this solar system?".colorize(:yellow)
    user_ss = gets.chomp.to_s
    user_ss = SolarSystem.new(user_ss)

    puts "\nSolar system #{ user_ss.name } has been created.".colorize(:yellow)

    while ss_p_creation_session == true
      puts "\nWould you like to add a planet to the solar system? (Yes or No)".colorize(:yellow)
      user_choice_ss_p_creation = gets.chomp.to_s

      # Inner case statement related to creation of new planets in a created solar system
      case user_choice_ss_p_creation
      when "Y", "Yes", "y", "yes"
        puts "\nWhat name would you like?".colorize(:yellow)
        p_name = gets.chomp.to_s
        puts "\nHow many rings should there be?".colorize(:yellow)
        p_r_count= gets.chomp.to_s
        puts "\nHow many moons should there be?".colorize(:yellow)
        p_m_count = gets.chomp.to_s
        puts "\nWhat kind of gas is in the atmosphere?".colorize(:yellow)
        p_a_gas = gets.chomp.to_s
        puts "\nWhat is the planet's mass?".colorize(:yellow)
        p_mass = gets.chomp.to_s
        puts "\nWhat's the planet's rate of rotation around its sun?".colorize(:yellow)
        p_rotation_rate = gets.chomp.to_s
        puts "\nHow far away is the planet from its sun?".colorize(:yellow)
        p_distance = gets.chomp.to_s

        # Used planet_count to be able to subtract one from it and obtain an array index
        planet_count += 1
        user_ss.add_planet(Planet.new(p_name, p_r_count, p_m_count, p_a_gas, p_mass, p_rotation_rate, p_distance))
        puts "\nYour new planet #{ user_ss.planet[planet_count - 1 ].name } in #{ user_ss.name } has been created!"

    when "N", "No", "n", "no"
        # Setting ss_p_creation_session to false halts access to its block of code, and flows the user back into solar system creation only.
        ss_p_creation_session = false
        puts "\nOkay then, woud you like to create another solor system?".colorize(:yellow)

      else
        puts "\nI don't understand what you wrote. Please try again! (Yes or No)".colorize(:yellow)
      end
    end

  when "N", "No", "n", "no"
    puts "\nOkay then, have a good day!".colorize(:yellow)
    # Learned about exit in Baby Dragon from Jeremy today
    exit
  else
    puts "\nI don't understand what you wrote. Please try again! (Yes or No)".colorize(:yellow)
  end
end
