class MediaSource < ApplicationRecord
  belongs_to :track
  belongs_to :media, polymorphic: true
end
