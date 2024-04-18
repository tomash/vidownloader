class Video < ApplicationRecord
  def clean_uri
    uri = URI(self.url)
    youtube_id = Rack::Utils.parse_query(uri.query)["v"]
    uri.query = "v=#{youtube_id}"
    uri.to_s
  end

  def fetch_title
    `yt-dlp --print "%(title)s" "#{self.clean_uri}"`.strip
  end
end
