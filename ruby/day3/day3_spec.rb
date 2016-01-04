require "set"

module Visitor
  def self.locations_visited moves="", visitors=1
    return 1 if moves.empty?

    moves = get_moves(moves, visitors)
    make_visits(moves).count
  end

  def self.get_moves moves="", visitors=1
    moves = moves.split("")
    return [moves] if visitors == 1

    individual_moves = divide_moves_among_visitors(moves, visitors)

    individual_moves.each_with_object([[],[]]) do | moves, sep_moves |
      sep_moves[0] << moves[0]
      sep_moves[1] << moves[1]
    end

  end

  def self.divide_moves_among_visitors moves, visitors
    individual_moves = []
    individual_moves << moves.slice!(0..visitors-1) while moves.count > 0
    individual_moves
  end

  def self.make_visits all_moves
    all_visits = []

    all_moves.each do | moves |
      current_location = [0,0]
      locations_visited = Set.new [current_location]

      moves.each do | move |
        current_location = make_move current_location, move
        locations_visited << current_location
      end

      all_visits << locations_visited
    end

    all_visits.reduce(:+)
  end

  def self.make_move location, move
    location = go_north(location) if move == "^"
    location = go_south(location) if move == "v"
    location = go_west( location) if move == "<"
    location = go_east( location)  if move == ">"
    location
  end

  def self.go_east location
    [location[0]+1, location[1]]
  end

  def self.go_west location
    [location[0]-1, location[1]]
  end

  def self.go_north location
    [location[0], location[1]+1]
  end

  def self.go_south location
    [location[0], location[1]-1]
  end

end

describe Visitor do
  context "When there is more than a single Santa" do
    it "counts two moves correctly" do
      visits = Visitor.locations_visited("^v", 2)
      expect(visits).to eq 3
    end

    it "Part 2 solution: tracks a very large set of moves" do
      moves = File.read("input").chomp
      expect(Visitor.locations_visited(moves, 2)).to eq 2639
    end
  end

  context "When there is just a single Santa" do
    it "counts the starting location" do
      expect(Visitor.locations_visited).to eq 1
    end

    it "counts a move to the north" do
      visits = Visitor.locations_visited("^")
      expect(visits).to eq 2
    end

    it "counts a move to the south" do
      visits = Visitor.locations_visited("v")
      expect(visits).to eq 2
    end

    it "counts a move to the west" do
      visits = Visitor.locations_visited("<")
      expect(visits).to eq 2
    end

    it "counts a move to the east" do
      visits = Visitor.locations_visited(">")
      expect(visits).to eq 2
    end

    it "tracks a compound set of moves" do
      visits = Visitor.locations_visited("^v^v^v^v^v")
      expect(visits).to eq 2
    end

    it "tracks a compound set of moves" do
      visits = Visitor.locations_visited("^>v<")
      expect(visits).to eq 4
    end

    it "Part 1 solution: tracks a very large set of moves" do
      moves = File.read("input").chomp
      expect(Visitor.locations_visited(moves)).to eq 2565
    end
  end
end
