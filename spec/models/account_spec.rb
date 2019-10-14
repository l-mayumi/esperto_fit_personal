require 'rails_helper'

RSpec.describe Account, type: :model do
    describe 'type: customer' do
        it 'must have a document' do
            account = create(:account)
            expect(account).to be_valid
            account.document = nil
            expect(account).to_not be_valid
        end
    end

    describe 'type: personal' do
        it 'must have a document' do
            personal = create(:personal)
            expect(personal).to be_valid
            personal.document = nil
            expect(personal).to_not be_valid
        end


        it 'must have a unique document' do
            personal = create(:personal, document:'32345678900')
            other_personal = create(:personal, document: '32345678901')
            expect(personal).to be_valid
            personal.document = '32345678901'
            expect(personal).to_not be_valid
        end
    end
end
