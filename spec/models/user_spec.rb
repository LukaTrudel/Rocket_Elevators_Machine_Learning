require 'rails_helper'

# Small test to validate the presence of an email and password
RSpec.describe User, :type => :model do
    context 'validating attributes' do
        user = User.new(email: 'rocket.dave@gmail.com', password: 'dogcat1')

        it 'is valid with an email' do
            expect(user).to be_valid if user.email != nil
        end

        it 'is valid with a password' do
            expect(user).to be_valid if user.password != nil
        end
    end  
end