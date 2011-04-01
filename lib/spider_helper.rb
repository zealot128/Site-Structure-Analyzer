require "anemone"
require "mongo"
require "colorize"
require "action_view"

class SpiderHelper
  include ActionView::Helpers::TextHelper

  def initialize(config)
    @domain = config["domain"]
    @ignore = config["ignore_links"]
    @depth_limit = config["depth_limit"]
    @base_uri = URI.parse(@domain)
  end


  def crawl
    options = {
      :threads => 6,
      :depth_limit => 4,
      :accept_cookies => true
    }
    options[:depth_limit] = @depth_limit if @depth_limit

    Anemone.crawl(@domain,options) do |anemone|
      anemone.storage = Anemone::Storage.MongoDB

      anemone.on_every_page do |page| 
        title =  page.doc.at('title').inner_html rescue "" 

        p = Page.find_or_initialize_by_url(page.url.to_s)

        p.status_code = page.code 
        p.size = page.body.length
        p.title = title || ""
        p.save

        begin
          code = page.code
          code = code >= 300 ?  code.to_s.yellow : code.to_s.green
          puts "#{code} " + truncate(page.url.to_s, :length => 80).light_white + " " + truncate(title).light_green 
        rescue Exception => e
          puts e.inspect
          puts e.backtrace
          puts "ERROR:".red + "#{page.url}"
        end
        process_link(page.doc, p)
      end

      anemone.skip_links_like( *@ignore.map{|i| Regexp.new i} )

    end
  end

  def process_link(doc, page)
    return if doc.nil?
    doc.search("a").each do  |a|
      target_link = URI.parse(a.attributes["href"].value) rescue next
      nofollow = a.attributes["rel"].include?("nofollow") rescue false
      title = a.attributes["title"].value rescue ""

      next if @ignore.any? {|keyword| target_link.to_s.include? keyword} 
      next if target_link == "" or target_link.nil?
      target_link = URI.join page.url, target_link rescue next

      if target_link.host == @base_uri.host

        other        = Page.find_or_create_by_url(target_link.to_s)
        pl           = PagesLink.new
        pl.from_page = page
        pl.to_page   = other     
        pl.no_follow = nofollow  || false
        pl.title     = title || ""
        pl.save
      end
    end
  end
end
