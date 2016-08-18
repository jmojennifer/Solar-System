class Planet
attr_accessor :name, :rings, :moons, :atmospheric_makeup, :mass, :rate_of_rotation, :distance_from_sun

  def initialize(n, r, m, a_makeup, ma, r_of_rotation, dist_from_sun)
    @name = n
    @rings = r
    @moons = m
    @atmospheric_makeup = a_makeup
    @mass = ma
    @rate_of_rotation = r_of_rotation
    @distance_from_sun = dist_from_sun
  end

end
