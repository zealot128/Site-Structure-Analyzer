module PagesLinksHelper

  def format_page(page)
    url = URI.parse page.url
    url.host = nil
    url.scheme = nil
    link_to truncate(url.to_s, :length => 70), page.url, :target => "_blank"
  end

  def format_link_text(text)
    content_tag :acronym, :title => text do
      truncate text, :length => 40 
    end
  end
end
