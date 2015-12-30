module Packager
  module Shared
    def self.get_dimensions dimension_string
      convert_to_integers dimension_string.split("x")
    end

    def self.convert_to_integers dimensions
      dimensions.map{|i| i.to_i}
    end
  end

  module Wrapping
    def self.calculate packages
      packages.each_with_object([]) do | dimensions, feet_of_wrap |
        feet_of_wrap << calculate_package_wrapping(dimensions)
      end.reduce(:+)
    end

    def self.calculate_package_wrapping dimensions
      areas = calculate_each_side_areas Shared.get_dimensions(dimensions)

      calculate_total_areas(areas) + get_slack(areas)
    end

    def self.get_slack areas
      areas.min
    end

    def self.calculate_total_areas areas
      areas.reduce(:+) * 2
    end

    def self.calculate_each_side_areas dims
      areas = []
      areas << dims[0] * dims[1]
      areas << dims[1] * dims[2]
      areas << dims[0] * dims[2]
    end
  end

  module Ribbon
    def self.calculate packages
      packages.each_with_object([]) do | dimensions, feet_of_ribbon |
        feet_of_ribbon << calculate_package_ribbon(dimensions)
      end.reduce(:+)
    end

    def self.calculate_package_ribbon dimensions
      dims = Shared.get_dimensions(dimensions)

      get_ribbon_length(dims) + get_bow_size(dims)
    end

    def self.get_bow_size dimensions
      dimensions.reduce(:*)
    end

    def self.get_ribbon_length dimensions
      dimensions.sort[0..1].reduce(:+) * 2
    end
  end
end

describe Packager do
  context "When calculating wrapping paper" do
    it "calculates the wrap required for a single package" do
      expect(Packager::Wrapping.calculate(["2x3x4"])).to eq 58
    end

    it "Part 1 solution: calculates the total wrap for a long list of packages" do
      input = File.readlines("inputs").map{|i| i.chomp}
      expect(Packager::Wrapping.calculate(input)).to eq 1598415
    end
  end

  context "When calculating ribbon" do
    it "calculates the ribbon required for a single package" do
      expect(Packager::Ribbon.calculate(["2x3x4"])).to eq 34
    end

    it "Part 2 solution: calculates the total ribbon for a list of packages" do
      input = File.readlines("inputs").map{|i| i.chomp}
      expect(Packager::Ribbon.calculate(input)).to eq 3812909
    end
  end
end

