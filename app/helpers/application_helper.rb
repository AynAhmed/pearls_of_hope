module ApplicationHelper
    def program_image_path(program)
      case program.name
      when "Al-Mustaqbal Academy"
        asset_path("al_mustaqbal_academy.jpg")
      when "Charms"
        asset_path("charms.jpg")
      when "Climb"
        asset_path("climb.jpg")
      when "Diamonds"
        asset_path("diamonds.jpg")
    when "Explorers"
        asset_path("explorers.jpg")
    when "Frontiers"
        asset_path("frontiers.jpg")
    when "Pearls"
        asset_path("pearls.jpg")
    when "Jewels"
        asset_path("jewels.jpg")
      else
        # Return a placeholder image path if specified image is not found
        asset_path("poh.jpg")
      end
    end
  end