module TextContentHelper
    def fetch_text_content_body_by_title(title)
        TextContent.find_by(title: title)&.body
      end
end
