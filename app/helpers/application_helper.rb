module ApplicationHelper
  def page_title(page_title = "")
    base_title = "GAMEFOLIO"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def default_meta_tags
    {
      site: 'GAMEFOLIO',
      title: 'GAMEFOLIO',
      reverse: true,
      charset: 'utf-8',
      description: 'ゲームを記録してポートフォリオを充実させよう',
      keywords: 'ゲーム',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: 'GAMEFOLIO',
        title: 'GAMEFOLIO',
        description: 'ゲームを記録してポートフォリオを充実させよう',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_image.png'),
        local: 'ja-JP'
      },

      twitter: {
        card: 'summary_large_image',
        #site: '@', # アプリの公式Twitterアカウントがあれば
        image: image_url('ogp_image.png')
      }
    }
  end
end
