module VideoHelper
    def embed_video_by_title(title)
      video = Video.find_by(title: title)
      return nil unless video
  
      # Assuming the URL is a YouTube link
      youtube_embed(video.url)
    end
  
    def youtube_embed(youtube_url)
      if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
      else
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
      end
      "https://www.youtube.com/embed/#{youtube_id}"
    end
  end
  