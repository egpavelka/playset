require 'test_helper'

class EmbeddedTest < ActiveSupport::TestCase
  track_paths = {
    :bandcamp => {
      good: ['http://grabbingclouds.bandcamp.com/track/cosmos-dont-wake-me-2',
      'https://grabbingclouds.bandcamp.com/track/cosmos-dont-wake-me-2',
      'grabbingclouds.bandcamp.com/track/cosmos-dont-wake-me-2'
      ],
      bad: ['http://grabbingclouds.bandcamp.com/album/cosmos-astrid-and-me-33-brewer-street',
      'https://grabbingclouds.bandcamp.com/album/cosmos-astrid-and-me-'
      ]
    }
  }
  # test "the truth" do
  #   assert true
  # end
end
