## PLAYSETTE

This is the testing ground for PLAYSETTE, a sort of social network for music discovery.

### Main Features

-Site collects user-submitted audio tracks into a single feed on its homepage to be listened to and voted on by the user base. (Index will be sorted with standard tabs hot, top, and new, as well as a section populated with submissions from the user's followed users.)

-Users will be able to submit songs from various streaming services and by file uploads and listen to all in one cohesive place.

-User profiles will display timelines of their submissions and liked tracks, lists of followers/following, and (optionally) a short bio, photo, social media links, etc.

### Track Submission Methods

-Upload MP3 and detect metadata if available. (flags: not music, spam, broken; prevent: by audio length, file size, file type, user's total upload size)

-Submit video via YouTube or Vimeo. (flags: not music, spam; prevent: < 1 min or > 25min; warn: > 10min)

-OAuth for connection to Soundcloud, Spotify, Bandcamp, etc.

### Later Features

-Users can create, like, and follow playlists.

-User receives notifications for follows and track or playlist likes and comments.

-Genre/custom tags (allow following?)

-Possible Discogs metadata lookup for untagged uploads and YouTube links.

-When a track is submitted from one OAuth site, search for the same on other sites and add those sources to the track.  User will be able to filter out tracks from services he can't access or will be shown the same track from a service he has linked.  (E.g., User A submits Track A from Spotify, but User B doesn't have a Spotify account linked and can't stream Track A without one.  If User B has authorized a Soundcloud account and Track A is available there, that source will automatically be swapped in if source filtering is on.)
