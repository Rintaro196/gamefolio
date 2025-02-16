require "mini_magick"

class OgpGenerator
    def self.generate(user)

        return unless user.user_icon.attached?

        base_image = MiniMagick::Image.open(Rails.root.join("app/assets/images/profile_ogp.png"))
        
        icon_url = url_for(user.user_icon)
        icon = MiniMagick::Image.open(icon_url)

        #画像を丸く切り抜く用のマスク画像を作成
        mask = MiniMagick::Image.open(icon_url)
        mask.format "png"
        mask.combine_options do |img|
            img.alpha "transparent"
            img.background "none"
            img.fill "white"
            img.draw "circle 100,100 100,0"
        end

        #マスクを適用
        icon.comppsite(mask) do |img|
            img.compose "CopyAlpha"
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

        File.delete(temp_path) if File.exist?(temp_path)
    end
end