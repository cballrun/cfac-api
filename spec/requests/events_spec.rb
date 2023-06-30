require 'rails_helper'

RSpec.describe "", type: :request do
    before(:each) do
        event_0 = Event.create(name: "Event 1", city: "Sunnyvale", location: "Trailer Park", description: "Cheeseburger Picnic", state: "NS" )
        event_1= Event.create(name: "Event 2", city: "Destin", location: "Beachfront", description: "Surfing", state: "FL" )
        event_2 = Event.create(name: "Event 3", city: "Atlanta", location: "City in the trees", description: "Varsity", state: "GA" )
    end

    it 'returns 3 events' do

        post "/graphql", params: { query: query_string }
        expect(response).to be_successful
        reply = JSON.parse(response.body, symbolize_names: true)
        data = reply[:data]

        expect(data[:events].count).to eq(3)
    end

    def query_string
        <<~GQL
            query {
                events {
                    id
                    name
                    city
                    state
                    location
                    description
                }
            }
        GQL
    end
end