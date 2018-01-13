# Bandcamp media links expire every 24 hours.  This job will
# set an automatic refresh for each link every 24 hours after its creation.
class BandcampResetJob < ApplicationJob
  queue_as :default

  def self.media_exists?(media)
    
  end

  def perform(bandcamp)
    return if media_exists?(bandcamp)
    BandcampService.get_media_link(bandcamp)
    bandcamp.save!
  end
end

=begin
Probably need to a) spread these out throughout the day,
b) use a proxy switcher for each request to prevent Bandcamp
from flagging the crawler IP (see
https://stackoverflow.com/questions/17489621/change-ip-address-in-ruby),
and/or 3) putting the media path update logic inside the show
method in the controller -- this would
put the request weight on the client side but also on Bandcamp, which
seems like pretty terrible etiquette.  It's also important to mask
the actual media path if possible--this is decently covered in the React
logic for Soundcloud embeds, but this would probably require that idea about
clearing audio src URLs from the DOM when developer tools are opened
(via browser shortcuts or context menus, but wiping all audio and
forcing a refresh everytime the user right clicks is totally insane.
tl;dr come up with something less stupid
=end
