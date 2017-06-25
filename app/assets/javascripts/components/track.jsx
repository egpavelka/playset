class Track extends React.Component {
  render() {
    return (
      <div id={`track-${track.id}`} className="row track">
            <div className="col-xs-3">
              <div className="track-rank">
                <span className="glyphicon glyphicon-play" aria-hidden="true" style="float:left">
              </span></div>
            </div>
            <div className="col-xs-6 col-xs-offset-2 text-right track-info">
                <div className="track-title">
                  ${track.title}
                </div>
                <div className="track-artist">
                  ${track.artist}
                </div>
              <div>
                <span className="track-album">
                  ${track.album}
                </span>
                <span className="track-year">
                  ${track.year}
                </span>
              </div>
            </div>

            <div className="col-xs-8 track-details">
              ${posted_by}
              <div className="col-xs-offset-1 track-timestamp">
              ${track.updated_at}
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
