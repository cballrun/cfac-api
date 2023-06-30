require 'rails_helper'

RSpec.describe "Fetch Event By Id", type: :request do
  before(:each) do
    @event0 = Event.create(name: "Event 1", city: "Sunnyvale", location: "Trailer Park", description: "Cheeseburger Picnic", state: "NS" )
    @event1= Event.create(name: "Event 2", city: "Destin", location: "Beachfront", description: "Surfing", state: "FL" )
    @event2 = Event.create(name: "Event 3", city: "Atlanta", location: "City in the trees", description: "Varsity", state: "GA" )

    @sponsor0 = Sponsor.create(name: "Sponsor 0", description: "New Description", logo: "Logo")
    @sponsor1 = Sponsor.create(name: "Sponsor 1", description: "New Description1", logo: "Logo1")
    @sponsor2 = Sponsor.create(name: "Sponsor 2", description: "New Description2", logo: "Logo2")

    @sponsor_event0 = SponsorEvent.create(sponsor_id: @sponsor0.id, event_id: @event0.id)
    @sponsor_event1 = SponsorEvent.create(sponsor_id: @sponsor1.id, event_id: @event1.id)
    @sponsor_event2 = SponsorEvent.create(sponsor_id: @sponsor2.id, event_id: @event2.id)
    @sponsor_event3 = SponsorEvent.create(sponsor_id: @sponsor0.id, event_id: @event1.id)
    @sponsor_event4 = SponsorEvent.create(sponsor_id: @sponsor1.id, event_id: @event2.id)
    @sponsor_event5 = SponsorEvent.create(sponsor_id: @sponsor0.id, event_id: @event2.id)

    @vendor0 = Vendor.create(name: "Vendor 0", description: "New Description", logo: "Logo")
    @vendor1 = Vendor.create(name: "Vendor 1", description: "New Description1", logo: "Logo1")
    @vendor2 = Vendor.create(name: "Vendor 2", description: "New Description2", logo: "Logo2")
    
    @vendor_event0 = VendorEvent.create(vendor_id: @vendor0.id, event_id: @event0.id)
    @vendor_event1 = VendorEvent.create(vendor_id: @vendor1.id, event_id: @event1.id)
    @vendor_event2 = VendorEvent.create(vendor_id: @vendor2.id, event_id: @event0.id)
    @vendor_event3 = VendorEvent.create(vendor_id: @vendor2.id, event_id: @event1.id)
    @vendor_event4 = VendorEvent.create(vendor_id: @vendor2.id, event_id: @event2.id)

    @artist0 = Artist.create(name: "Artist 0", logo: "Logo")
    @artist1 = Artist.create(name: "Artist 1", logo: "Logo1")
    @artist2 = Artist.create(name: "Artist 2", logo: "Logo2")
    
    @artist_event0 = ArtistEvent.create(artist_id: @artist0.id, event_id: @event0.id)
    @artist_event1 = ArtistEvent.create(artist_id: @artist1.id, event_id: @event1.id)
    @artist_event2 = ArtistEvent.create(artist_id: @artist2.id, event_id: @event0.id)
    @artist_event3 = ArtistEvent.create(artist_id: @artist2.id, event_id: @event1.id)
    @artist_event4 = ArtistEvent.create(artist_id: @artist2.id, event_id: @event2.id)
  end
  it 'returns the event and its associated vendors, sponsors & artists' do

    post "/graphql", params: { query: query_string(@event0.id) }
    expect(response).to be_successful
    reply = JSON.parse(response.body, symbolize_names: true)
    data = reply[:data]
    expect(data[:findEvent][:name]).to eq(@event0.name)
    expect(data[:findEvent][:city]).to eq(@event0.city)
    expect(data[:findEvent][:state]).to eq(@event0.state)
    expect(data[:findEvent][:location]).to eq(@event0.location)
    expect(data[:findEvent][:description]).to eq(@event0.description)
    expect(data[:findEvent][:artistEvents].count).to eq(2)
    expect(data[:findEvent][:sponsorEvents].count).to eq(1)
    expect(data[:findEvent][:vendorEvents].count).to eq(2)
    expect(data[:findEvent][:vendorEvents][0][:vendor][:name]).to eq(@vendor0.name)
    expect(data[:findEvent][:artistEvents][1][:artist][:name]).to eq(@artist2.name)
    expect(data[:findEvent][:sponsorEvents][0][:sponsor][:name]).to eq(@sponsor0.name)
  end
  def query_string(id)
    <<~GQL
      query {
        findEvent(id: "#{id}") {
          id
          name
          city
          state
          location
          description
          sponsorEvents {
            id 
            sponsor {
              id 
              name
            }
          } 
          artistEvents {
            id 
            artist {
              id 
              name 
              logo
              spotifyUrl 
              instagramUrl
            }
          }
          vendorEvents {
            id 
            vendor {
              id 
              name
            }
          } 
        }
      }
    GQL
  end
end