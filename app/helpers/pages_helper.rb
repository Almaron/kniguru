module PagesHelper

  def last_news_link
    news = News.last
    inner_div = "<div class=\"latest-news-date\">#{l(news.created_at, :format => :last_news).downcase}</div>
    #{news.head}"
    link_to inner_div.html_safe, news
  end

  def last_comments_root
    Comment.approved.order(:created_at => :desc).limit(5)
  end

  def last_news_root
    News.order(:created_at => :desc).limit(3).map do |news|
      link_to news.head, news
    end
  end

end
