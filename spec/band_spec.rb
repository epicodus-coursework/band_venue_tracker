require("spec_helper")

describe(Band) do
  it("validates presence of a name") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end

  it("capitalizes the first letter of the name") do
    band = Band.create({:name => "new band"})
    expect(band.name()).to(eq("New band"))
  end
end
