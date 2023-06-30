# frozen_string_literal: true

module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :city, String
    field :state, String
    field :location, String
    field :artist_events, [Types::ArtistEventType]
    field :sponsor_events, [Types::SponsorEventType]
    field :vendor_events, [Types::VendorEventType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :description, String
  end
end
