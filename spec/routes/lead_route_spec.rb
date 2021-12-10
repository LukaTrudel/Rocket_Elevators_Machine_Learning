require 'rails_helper'

RSpec.describe "Lead creation routing", :type => :routing do
    it 'routes /contact to the Contact Controller' do
        expect(post("/contact")).to route_to("contact#create") 
    end
end