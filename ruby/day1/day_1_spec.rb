class SantaClimber
  def self.climb map=""
    floor = 0
    underground_at = nil

    map.split("").each_with_index do | direction, i |
      floor = calculate_move(floor, direction)
      underground_at = i + 1 if underground_at.nil? && floor < 0
    end

    {floor: floor, underground_at: underground_at}
  end

  def self.calculate_move floor, direction
    if direction == "("
      floor += 1
    elsif direction == ")"
      floor -= 1
    end
    floor
  end
end

describe SantaClimber do
  it "begins at 0" do
    expect(SantaClimber.climb[:floor]).to eq 0
  end

  it "recognizes '(' increases the floor by 1" do
    expect(SantaClimber.climb("(")[:floor]).to eq 1
  end

  it "recognizes '((' increases the floor by 2" do
    expect(SantaClimber.climb("((")[:floor]).to eq 2
  end

  it "recognizes ')' decreases the floor by 2" do
    expect(SantaClimber.climb("))")[:floor]).to eq -2
  end

  it "handles a mixed set of directions" do
    expect(SantaClimber.climb("))(((((")[:floor]).to eq 3
    expect(SantaClimber.climb(")())())")[:floor]).to eq -3
  end

  it "handles a large set of mixed directions" do
    map = File.read("inputs").chomp
    expect(SantaClimber.climb(map)[:floor]).to eq 74
  end

  it "tracks when it never goes underground" do
    map = "(("
    santa = SantaClimber.climb(map)
    expect(santa[:underground_at]).to be nil
  end

  it "tracks when it goes underground for the first time" do
      map = File.read("inputs").chomp
    santa = SantaClimber.climb(map)
    expect(santa[:underground_at]).to eq 1795
  end
end


