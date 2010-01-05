class UrlInfosController < ApplicationController
  # GET /url_infos
  # GET /url_infos.xml
  def index
    @url_infos = UrlInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @url_infos }
    end
  end

  # GET /url_infos/1
  # GET /url_infos/1.xml
  def show
    @url_info = UrlInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @url_info }
    end
  end

  # GET /url_infos/new
  # GET /url_infos/new.xml
  def new
    @url_info = UrlInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @url_info }
    end
  end

  # GET /url_infos/1/edit
  def edit
    @url_info = UrlInfo.find(params[:id])
  end

  # POST /url_infos
  # POST /url_infos.xml
  def create
    @url_info = UrlInfo.new(params[:url_info])
    @url_info.clicks = 0
    respond_to do |format|
      if @url_info.save
        flash[:notice] = 'UrlInfo was successfully created.'
        format.html { redirect_to(@url_info) }
        format.xml  { render :xml => @url_info, :status => :created, :location => @url_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @url_info.errors, :status => :unprocessable_entity }
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
