module ImageHelper
    def fetch_image_by_title(title)
      Image.find_by(title: title)
    end
  end