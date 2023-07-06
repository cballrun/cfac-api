module Queries
    class FindEvent < Queries::BaseQuery
        type Types::EventType, null: false
        argument :id, String, required: true
        
        def resolve(id:)
            if event = Event.find(id)
                return event
            else raise GraphQL::ExecutionError, "The event you are searching for cannot be located in the database."
            end
        end
    end
end