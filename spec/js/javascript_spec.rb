require 'rails_helper'

RSpec.feature 'Testing Javascript', type: :feature, javascript: true do
  scenario 'Changing text' do
    list_gyms
    visit new_account_session_path
    within('div#content') do
      page.execute_script("$('h2').text('Fazer login');")
    end
    save_and_open_page

    within('div#content') do
      expect(page).to have_css('h2', text: 'Fazer login')
    end
  end
end