require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get("/") do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get("/bands") do
  @bands = Band.all()
  erb(:bands)
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/bands") do
  name = params.fetch("name")
  @band = Band.new({:name => name, :done => false})
  @band.save()
  if @band.save()
    redirect("/bands")
  else
    erb(:band_errors)
  end
end

post("/venues") do
  name = params.fetch("name")
  @venue = Venue.new({:name => name, :done => false})
  @venue.save()
  if @venue.save()
    redirect("/venues")
  else
    erb(:venue_errors)
  end
end

get("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:band_info)
end

get("/venues/:id") do
  @venue = Venue.find(params.fetch("id").to_i())
  @bands = Band.all()
  erb(:venue_info)
end

patch("/bands/:id") do
  name = params.fetch("name")
  @band = Band.find(params.fetch("id").to_i())
  @band.update({:name => name})
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

delete("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete()
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end
