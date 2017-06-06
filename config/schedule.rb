set :output, "log/cron.log"

every 2.hours do
  command 'Embedded.where("track.nil? && created_at < ?", 1.hour.ago).delete_all'
  command 'Track.where("(!published || media.nil?) && created_at < ?", 1.hour.ago).destroy_all'
end

every 1.month do
  command 'User.where("!activated && created_at < ?", 28.days.ago).destroy_all'
end
