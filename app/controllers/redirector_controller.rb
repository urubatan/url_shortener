class RedirectorController < ApplicationController
  def index
	  ui = UrlInfo.find params[:id]
	  redirect_to ui.href if ui
  end

end
