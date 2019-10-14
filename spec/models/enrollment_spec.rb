require 'rails_helper'

RSpec.describe Enrollment, type: :model do
    describe 'registers the right' do
        it 'customer' do
            account = create(:account)
            unit = create(:unit)
            enrollment = Enrollment.create(account: account, unit: unit)

            expect(enrollment.account).to eq account
        end

        it 'unit' do
            account = create(:account)
            unit = create(:unit)
            another_unit = create(:unit)
            enrollment = Enrollment.create(account: account, unit: unit)

            expect(enrollment.unit).to eq unit
            enrollment.unit = another_unit
            expect(enrollment.unit).to eq another_unit
        end
    end

end
