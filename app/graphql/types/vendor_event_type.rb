# frozen_string_literal: true

module Types
  class VendorEventType < Types::BaseObject
    field :id, ID, null: false
    field :vendor_id, Integer, null: false
    field :event_id, Integer, null: false
    field :vendor, Types::VendorType
    field :event, Types::EventType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
