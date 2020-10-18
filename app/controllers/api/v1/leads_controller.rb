class Api::V1::LeadsController < Api::V1::ApplicationController
  def index
    @leads = Lead.all
    render 'list_for_api'
  end
end
