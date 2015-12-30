class Packager
  def self.wrapping packages
    packages.each_with_object([]) do | dimensions, feet_of_wrap |
      feet_of_wrap << calculate_package_wrapping(dimensions)
    end.reduce(:+)
  end

  private

  def self.calculate_package_wrapping dimensions
    areas = calculate_each_side_areas get_dimensions(dimensions)

    calculate_total_areas(areas) + get_slack(areas)
  end

  def self.get_slack areas
    areas.min
  end

  def self.calculate_total_areas areas
    areas.reduce(:+) * 2
  end

  def self.get_dimensions dimension_string
    convert_to_integers dimension_string.split("x")
  end

  def self.convert_to_integers dimensions
    dimensions.map{|i| i.to_i}
  end

  def self.calculate_each_side_areas dims
    areas = []
    areas << dims[0] * dims[1]
    areas << dims[1] * dims[2]
    areas << dims[0] * dims[2]
  end
end

describe Packager do
  it "calculates the wrap required for a single package" do
    expect(Packager.wrapping(["2x3x4"])).to eq 58
  end

  it "calculates the total wrap required for multiple packages" do
    expect(Packager.wrapping(["2x3x4", "1x1x10"])).to eq 101
  end

  it "Part 1 solution: calculates the total wrap for a long list of packages" do
    input = File.readlines("inputs").map{|i| i.chomp}
    expect(Packager.wrapping(input)).to eq 1598415
  end
end

