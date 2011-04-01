class PagesLinksController < ApplicationController
  # GET /pages_links
  # GET /pages_links.xml

  # GET /pages_links/1
  # GET /pages_links/1.xml
  def show
    @pages_link = PagesLink.find(params[:id])

  end
  def links
    @page = Page.find(params[:page_id])
    @pages_links = PagesLink.where(:from_page_id => @page.id)
    if request.xhr?
      render :layout => false
    end
  end

  def backlinks
    @page = Page.find(params[:page_id])
    @couples = PagesLink.where(:to_page_id => @page.id)
    @couples = @couples.group_by{|i| i.from_page_id }.sort_by{|i| -i[1].count}
    if request.xhr?
      render :layout => false
    end

  end
end
