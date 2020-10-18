class LeadsApi
  include HTTParty
  headers 'X-Api-Key': 'hsqucKZm3UkDDLb7xdmSSwtt'

  attr_accessor :error_message

  def get_json(url, params = {})
    begin
      response = self.class.get(url, query: params)
    rescue StandardError => e
      self.error_message = "Leads API: #{e.message}"
      return false
    end
    # JSON
    JSON.parse(response.body, symbolize_names: true)
  end
end
