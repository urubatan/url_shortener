class UrlInfosController < ApplicationController
  # GET /url_infos
  # GET /url_infos.xml
  def index
    @url_infos = UrlInfo.all
    @url_info = UrlInfo.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @url_infos }
    end
  end

  # POST /url_infos
  # POST /url_infos.xml
  def create
    @url_info = UrlInfo.new(params[:url_info])
    @url_info.href = params[:href] if params[:href]
    @url_info.clicks = 0
    respond_to do |format|
      if @url_info.save
        format.html  do
          flash[:notice] = 'UrlInfo was successfully created.'
          redirect_to root_url
        end
        format.xml  { render :xml => @url_info, :status => :created, :location => @url_info }
	format.js  do
          @url_infos = UrlInfo.all
          @url_info = UrlInfo.new
          render :update do |page|
            page.replace_html 'form', :partial => 'editor_form'
            page.replace_html 'table', :partial => 'urls_table'
            page.alert 'UrlInfo was successfully created.'
          end 
        end
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @url_info.errors, :status => :unprocessable_entity }
        format.js do
          render :update do |page|
            page.alert @url_info.errors.full_messages.join '\n'
          end
        end
      end
    end
  end

  # PUT /url_infos/1
  # PUT /url_infos/1.xml
  def update
    @url_info = UrlInfo.find(params[:id])

    respond_to do |format|
      if @url_info.update_attributes(params[:url_info])
        flash[:notice] = 'UrlInfo was successfully updated.'
        format.html { redirect_to(@url_info) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @url_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /url_infos/1
  # DELETE /url_infos/1.xml
  def destroy
    @url_info = UrlInfo.find(params[:id])
    @url_info.destroy

    respond_to do |format|
      format.html { redirect_to(url_infos_url) }
      format.xml  { head :ok }
    end
  end
end
