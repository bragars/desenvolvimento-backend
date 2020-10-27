module Types
  class QueryType < Types::BaseObject
    field :summary, [Types::SummaryType], null: false
    field :all_states, [Types::StateType], null: false
    field :find_state, [StateType], null: true do
      argument :state, String, required: true
    end

    field :all_states_limit, [StateType], null: false do
      argument :per_page, Integer, required: false, default_value: 10
      argument :start, Integer, required: false, default_value: 1
    end

    field :state_filter, [StateType], null: false do
      argument :text, String, required: true
    end

    # field :state_filter_date, [StateTimeType], null: false do
    #   argument :state, String, required: true
    #   argument :date, String, required: true
    # end

    field :state_filter_by_date, [StateType], [StateType], null: true do
      argument :date, String, required: true
      argument :state, String, required: true
    end

    field :state_time_filter_by_date, [StateTimeType],[StateTimeType], null: true do
      argument :date, String, required: true
      argument :state, String, required: true
    end

    def all_states_limit(per_page:, start:) # CORRECT
      state = State.limit(per_page).offset(start - 1)
    end

    def all_states # CORRECT
      State.all.order(state: :asc)
    end

    def state_filter(text:) # CORRECT
      State.where("state LIKE ?", "%#{text.downcase.capitalize}%")
    end

    def summary
      Summary.all
    end

    def find_state(state:) # CORRECT
      state = state.downcase
      State.where(state: state.capitalize)
    end

    # def state_filter_date(state:, date:) # CORRECT
    #   state = state.downcase
    #   StateTime.where(state: state.capitalize)
    # end

    def state_time_filter_by_date(state:, date:) # CORRECT
      StateTime.where("state LIKE ?", "%#{state}%").where("date LIKE ?", "%#{date}%")
    end

    def state_filter_by_date(state:, date:) # CORRECT
      State.where("state LIKE ?", "%#{state}%").where("date LIKE ?", "%#{date}%")
    end

  end
end