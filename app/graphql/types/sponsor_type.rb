# frozen_string_literal: true

module Types
  class SponsorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :logo, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
