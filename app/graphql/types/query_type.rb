module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :events, resolver: Queries::Events
    field :find_event, resolver: Queries::FindEvent


  end
end
