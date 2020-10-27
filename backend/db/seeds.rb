require 'httparty'

def get_by_dates
    current_months_acumulated = 8
    begin_in = 3

    for index  in 3..9 do
        aux = "0" + index.to_s
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
    end
end

def get_all_dates
    current_months_acumulated = 8
    begin_in = 3

    for index_month in 3..10 do
        aux_month = index_month 
        for index_days in 1..28
            aux_days = index_days

            if aux_days.to_s.length == 1
                aux_days = '0' + aux_days.to_s
            end

            if aux_month.to_s.length == 1
                aux_month = '0' + aux_month.to_s
            end

            url_aux = "2020" + aux_month.to_s + aux_days.to_s

            base_url = "https://covid19-brazil-api.now.sh/api/report/v1/brazil/#{url_aux}"
            request = HTTParty.get(base_url).body
            response = JSON.parse(request)
            response["data"].each_with_index do |state,i|
                datetime = state["datetime"]
                cases = state["cases"]
                deaths = state["deaths"]
                uf = state["uf"]    
                state = state["state"]
                State.create(uf: uf, state: state, cases:cases.to_i, deaths:deaths.to_i, date:datetime)
            end
        end
    end
end

get_by_dates
get_all_dates

puts "Seeds created"