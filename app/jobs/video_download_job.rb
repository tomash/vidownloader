class VideoDownloadJob < ApplicationJob
  queue_as :default

  def perform(video)
    output_dir = File.join(Rails.root, "videos")
    FileUtils.mkdir_p(output_dir)

    `yt-dlp \
      -o '#{output_dir}/%(title)s.%(ext)s' \
      --write-info-json \
      --write-thumbnail \
      --write-subs \
      --embed-subs \
      --sub-langs en \
      -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
      #{video.clean_uri}
    `
  end
end
