require 'rails_helper'
require 'spec_helper'

RSpec.describe QuoteController do
    !let(:quote){Quote.new}
    it "should give back a 200 successful HTTP response" do
        expect(@response.status).to eq (200)
    end

    it "should succesfully return a Lead object" do
        expect(@response.status).to eq (200)
        expect(quote).to_not eq (nil)
    end
end

# RSpec.describe "Quote", :type => :feature do
#     context "when visiting quotes page" do
#         it "should display the quote form" do
#             visit 'pages/quote'
#             expect(page).to have_text('Request a Quote')
#         end
#     end
# end