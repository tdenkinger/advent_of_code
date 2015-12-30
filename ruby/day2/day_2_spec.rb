class Packager
  def self.packages packages
    feet_of_wrap = 0
    packages.each do | dimensions |
      feet_of_wrap += calculate_package(dimensions)
    end
    feet_of_wrap
  end

  def self.calculate_package dimensions
    dims = get_dimensions dimensions
    areas = calculate_areas dims
    total_surface_area = calculate_total_areas areas
    slack = get_slack areas

    total_surface_area + slack
  end

  private

  def self.get_slack areas
    areas.min
  end

  def self.calculate_total_areas areas
    (areas[0] * 2) + (areas[1] * 2) + (areas[2] * 2)
  end

  def self.get_dimensions dimension_string
    convert_to_integers dimension_string.split("x")
  end

  def self.convert_to_integers dimensions
    dimensions.map{|i| i.to_i}
  end

  def self.calculate_areas dims
    areas = []
    areas << dims[0] * dims[1]
    areas << dims[1] * dims[2]
    areas << dims[0] * dims[2]
  end
end

describe Packager do
  it "calculates the wrap required for a single package" do
    expect(Packager.calculate_package("2x3x4")).to eq 58
  end

  it "calculates the total wrap required for multiple packages" do
    expect(Packager.packages(["2x3x4", "1x1x10"])).to eq 101
  end

  it "calculates the total wrap for a long list of packages" do
    input = File.readlines("inputs").map{|i| i.chomp}
    expect(Packager.packages(input)).to eq 1598415
  end
end

