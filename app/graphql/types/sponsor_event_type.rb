# frozen_string_literal: true

module Types
  class SponsorEventType < Types::BaseObject
    field :id, ID, null: false
    field :sponsor_id, Integer, null: false
    field :event_id, Integer, null: false
    field :sponsor, Types::SponsorType
    field :event, Types::EventType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
