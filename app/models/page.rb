class Page < ActiveRecord::Base
  has_many :links, :through => :from_pages_links, :source => "to_page"
  has_many :from_pages_links, :class_name => "PagesLink", :foreign_key => "from_page_id"

  has_many :backlinks, :through => :to_pages_links, :source => "from_page"
  has_many :to_pages_links, :class_name => "PagesLink", :foreign_key => "to_page_id"


  def self.update_links_count
    Page.all.each do |page|
      page.update_attributes(:links_count => page.links.count)
      page.update_attributes(:backlinks_count => page.backlinks.count)
    end

  end

  def w3validate(body)
    @@validator ||= W3CValidators::MarkupValidator.new(:validator_uri => SPIDER_CONFIG['w3c_url'])
    self.w3errors = @@validator.validate_text(body).errors.count
  end

end
