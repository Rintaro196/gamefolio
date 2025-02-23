require "mini_magick"
require "open-uri"

class OgpGenerator
    def self.generate(user)

        base_image = MiniMagick::Image.open(Rails.root.join("app/assets/images/profile_ogp.png"))

        icon_url = Rails.application.routes.url_helpers.rails_representation_url(user.user_icon.variant(resize: "200x200!", strip: true).processed, only_path: true)

        icon_image = URI.open(icon_url)
        icon = MiniMagick::Image.read(icon_image.read)
        icon.format "png"
        icon.resize "200x200"

        #画像を丸く切り抜く用のマスク画像を作成
        mask = MiniMagick::Image.open(icon.path)
        mask.combine_options do |img|
            img.alpha "transparent"
            img.background "none"
            img.fill "white"
            img.draw "circle 100,100 100,0"
        end

        #マスクを適用
        icon.composite(mask) do |img|
            img.compose "CopyOpacity"
        end

        #背景と合成
        base_image = base_image.composite(icon) do |img|
            img.gravity "center"
            img.geometry "+0+0"
        end

        tmp_path = Rails.root.join("tmp", "ogp_#{user.id}.png")
        base_image.write(tmp_path)

        user.user_ogp_image.attach(
            io: File.open(tmp_path),
            filename: "ogp_#{user.id}.png",
            content_type: "image/png"
        )

        File.delete(tmp_path) if File.exist?(tmp_path)
    end
end