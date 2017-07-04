class Track extends React.Component {
  constructor(props)  {
    super(props)
  }

  render() {
    const metadata = { title: this.props.track.title, artist: this.props.track.artist, album: this.props.track.album, year: this.props.track.year }
    return (
      <div id={`track-${ this.props.track.id }`} className="row track">

        <div className="track-background" style="background-image: url(<%= this.props.track.album_art.url(:large) %>); background-position: center">

          <div className="track-overlay">
            <div className="col-xs-4">
              <div className="track-play-button">
                  <span className="glyphicon glyphicon-play" aria-hidden="true"></span>
              </div>
            </div>

            <div className="col-xs-7 col-xs-offset-1 text-right track-info">
              <div className="track-title">{ this.props.track.title }</div>
              <div className="track-artist">{ this.props.track.artist }</div>
              <div className="track-album">{ this.props.track.album }</div>
              <div className="track-year">{ this.props.track.year }</div>
            </div>

            <div className="col-xs-7 track-details">
                posted by <%= link_to "#{User.find(track.user_id).username}", User.find(track.user_id) %> // <%= time_ago_in_words(track.updated_at) %> ago
            </div>

          </div>
        </div>

        <div className="track-base col-xs-12">

          <% if this.props.media_type == 'Embedded' %>
            <div className="embedded-service">
              <img src={`/assets/service_icons/${ this.props.media.source_service }.png`}/>
              via { this.props.media.source_service }
            </div>
          <% end %>

            <!-- <div>
                <span className="glyphicon glyphicon-envelope" aria-hidden="true"></span>
              <span>25 comments</span>
            </div> -->

            <div className="track-likes">
              <span className="track-like-button"><span className="glyphicon glyphicon-heart" aria-hidden="true"></span></span>
              <span className="track-like-count">450</span>
            </div>

        </div>
      </div>

          <audio controls>
            <source src={`${track.media_path}`} type="audio/mpeg">
          </audio>
    );
  }
}
