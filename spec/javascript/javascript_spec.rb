require 'rails_helper'

feature 'Testing Javascript' do
  before(:each) do
    list_gyms
  end

  scenario 'Changing text', js: true do
    visit root_path
    within('div.academia-1') do
      page.execute_script("$('h2').text('Unidade um');")
    end
    save_and_open_page

    within('div.academia-1') do
      expect(page).to have_css('h2', text: 'Unidade dois')
    end
  end
end