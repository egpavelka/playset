class Track extends React.Component {
  constructor(props)  {
    super(props)
  }

  render() {
    return (
      <div id={`track-${ this.props.track.id }`} className="row track">
            <div className="col-xs-3">
              <div className="track-rank">
                <span className="glyphicon glyphicon-play" aria-hidden="true" style="float:left">
              </span></div>
            </div>
            <div className="col-xs-6 col-xs-offset-2 text-right track-info">
                <div className="track-title">
                  { this.props.track.title }
                </div>
                <div className="track-artist">
                  { this.props.track.artist }
                </div>
              <div>
                <span className="track-album">
                  { this.props.track.album }
                </span>
                <span className="track-year">
                  { this.props.track.year }
                </span>
              </div>
            </div>

            <div className="col-xs-8 track-details">
              { this.props.postedBy.username }
              <div className="col-xs-offset-1 track-timestamp">
              { this.props.track.updated_at }
              </div>
            </div>

            <div className="col-xs-4 track-reactions-container">
              <div>
                <div className="track-reaction">
                  <span className="glyphicon glyphicon-heart" aria-hidden="true">
                  </span>
                </div>
              </div>

              <div>
                <div className="track-reaction">
                  <span className="glyphicon glyphicon-envelope" aria-hidden="true">
                  </span>
                </div>
              </div>
            </div>

          </div>

          <audio controls>
            <source src={`${track.media_path}`} type="audio/mpeg">
          </audio>
    );
  }
}
