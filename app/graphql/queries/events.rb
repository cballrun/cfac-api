module Queries
    class Events < Queries::BaseQuery
        type [Types::EventType], null: false

        def resolve
            if events = Event.all
                return events
            else raise GraphQL::ExecutionError, "There are no events in your database."
            end
        end
    end
end