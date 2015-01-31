require("spec_helper")

describe(Venue) do
  it("validates presence of a name") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end

  it("capitalizes the first letter of the name") do
    venue = Venue.create({:name => "new venue"})
    expect(venue.name()).to(eq("New venue"))
  end

  it { should have_and_belong_to_many(:bands) }
end
