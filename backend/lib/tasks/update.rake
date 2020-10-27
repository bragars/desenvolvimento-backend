require 'httparty'

def get_states
    base_url = "https://covid19-brazil-api.now.sh/api/report/v1"
    request = HTTParty.get(base_url).body
    response = JSON.parse(request)
    response["data"].each_with_index do |state, i|
      uf = state["uf"]
      datetime = state["datetime"]
      deaths = state["deaths"]
      cases = state["cases"]
      state = state["state"]
      State.create(uf: uf, state: state, cases:cases.to_i, deaths:deaths.to_i, date:datetime)
    end
end

namespace :update do
  desc "TODO"
  task database: :environment do
    get_states
  end
end
