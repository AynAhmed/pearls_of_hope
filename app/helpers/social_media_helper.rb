module SocialMediaHelper
    def fetch_social_media_embed_by_title(title)
      SocialMediaEmbed.find_by(title: title)&.embed_code
    end
  end
  