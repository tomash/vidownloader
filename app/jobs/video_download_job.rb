class VideoDownloadJob < ApplicationJob
  queue_as :default

  def perform(video)
    uri = URI(video.url)
    youtube_id = Rack::Utils.parse_query(uri.query)["v"]
    uri.query = "v=#{youtube_id}"
    `yt-dlp #{uri.to_s} --write-info-json`
  end
end
