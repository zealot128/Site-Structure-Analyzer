# Created by the Rails 3 jQuery Template
# http://github.com/lleger/Rails-3-jQuery, written by Logan Leger

namespace :spider do
  desc "Spider whole given domain"
  task :start => :environment  do |t,args|
    require "lib/spider_helper"
    s = SpiderHelper.new(SPIDER_CONFIG)
    s.crawl
  end

  desc "Clean Up all links for a complete new session, should be called before each crawling"
  task :clean => :environment  do |t,args|
    Page.delete_all
    PagesLink.delete_all
  end

  desc "Refresh the link/backlink count columns of pages for sorting purpose. Should be done after crawling a site"
  task :refresh_count => :environment  do |t,args|
    Page.self.update_links_count
  end
end
