module ApplicationHelper
  def page_title(page_title = "")
    base_title = "GAMEFOLIO"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def default_meta_tags
    {
      site: "GAMEFOLIO",
      title: "GAMEFOLIO",
      reverse: true,
      charset: "utf-8",
      description: "ゲームを記録してポートフォリオを充実させよう",
      keywords: "ゲーム",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: "GAMEFOLIO",
        title: "GAMEFOLIO",
        description: "ゲームを記録してポートフォリオを充実させよう",
        type: "website",
        url: request.original_url,
        image: image_url("ogp_image.png"),
        local: "ja-JP"
      },

      twitter: {
        card: "summary_large_image",
        image: image_url("ogp_image.png")
      }
    }
  end

  def user_icon_display(user, css_class)
    if user.user_icon.attached?
      image_tag user.user_icon, class: css_class
    else
     image_tag "avater.png", class: css_class
    end
  end
end
