require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post("/bands") do
  name = params.fetch("name")
  @band = Band.new({:name => name, :done => false})
  @band.save()
  if @band.save()
    redirect("/")
  else
    erb(:band_errors)
  end
end

post("/venues") do
  name = params.fetch("name")
  @venue = Venue.new({:name => name, :done => false})
  @venue.save()
  if @venue.save()
    redirect("/")
  else
    erb(:venue_errors)
  end
end

get('/bands/:id/edit') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_edit)
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
