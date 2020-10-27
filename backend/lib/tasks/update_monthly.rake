require 'httparty'

def get_by_dates
    aux = 11
    url_aux = "2020" + aux + "21"
    base_url = "https://covid19-brazil-api.now.sh/api/report/v1/brazil/#{url_aux}"
    request = HTTParty.get(base_url).body
    response = JSON.parse(request)
    response["data"].each_with_index do |state,i|
        uf = state["uf"]
        datetime = state["datetime"]
        deaths = state["deaths"]
        cases = state["cases"]
        state = state["state"]
        StateTime.create(uf: uf, state: state, cases:cases.to_i, deaths:deaths.to_i, date:datetime)
end

namespace :update_monthly do
  desc "TODO"
  task database_monthly: :environment do
  end

end
