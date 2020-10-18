class Api::V1::Leads
  LEADS_EENDPOINT = 'https://staging2.entscheider.com/api/v1/p/leads/available_leads_for_test'.freeze

  def initialize(params = {})
    @leads_api = LeadsApi.new
    @page = params[:page]
  end

  def readings
    @leads_api.get_json(
      LEADS_EENDPOINT,
      page: @page
    )
  end
end