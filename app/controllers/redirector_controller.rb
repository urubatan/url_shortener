class RedirectorController < ApplicationController
  def index
  	ui = UrlInfo.find params[:id]
	if ui
		ui.clicks += 1
		ui.save
  		redirect_to ui.href
	end
  end

end
