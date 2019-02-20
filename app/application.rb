class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      song_title = req.path.split("/songs/").last 	# turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == song_title}
      
      resp.write song.artist
    end
    if req.path=="/items"
      resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404				# Sets the status code.
    end

    resp.finish
  end
end