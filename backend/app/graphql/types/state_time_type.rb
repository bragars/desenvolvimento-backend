module Types
  class StateTimeType < Types::BaseObject
    field :id, ID, null: false
    field :uf, String, null: true
    field :state, String, null: true
    field :cases, String, null: true
    field :deaths, String, null: true
    field :date, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
