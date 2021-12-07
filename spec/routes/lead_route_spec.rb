require 'rails_helper'

# will validate the routing when a user creates a lead
RSpec.describe "Lead creation routing", :type => :routing do
    it 'routes /contact to the Contact Controller' do
        expect(post("/contact")).to route_to("contact#create") 
    end
end