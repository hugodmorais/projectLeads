class ApiCreateLeadsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    page = 1
    leads_count = 0

    while leads_count < 4
      get_leads(page).each do |lead_api|
        lead = Lead.find_by(first_name: lead_api[:first_name], last_name: lead_api[:last_name], zip_code: lead_api[:lead_zip_code])
        next if lead.present?

        lead = Lead.new(first_name: lead_api[:first_name], last_name: lead_api[:last_name], zip_code: lead_api[:lead_zip_code])
        leads_count += 1 if lead.save
        break if leads_count == 4
      end
      page += 1
    end
  end

  def get_leads(page)
    leads_api = Api::V1::Leads.new(page: page)
    leads_api.readings[:leads]
  end
end
