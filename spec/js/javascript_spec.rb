require 'rails_helper'

RSpec.feature 'Testing Javascript', type: :feature, javascript: true do
  scenario 'and changing text' do
    list_gyms
    visit new_account_session_path
    within('div#content') do
      page.execute_script("$('h2').text('Fazer login');")
    end

    within('div#content') do
      expect(page).to have_css('h2', text: 'Fazer login')
    end
  end

  scenario 'and saving a screenshot' do
    list_gyms
    visit new_account_session_path
    within('div#content') do
      page.execute_script("$('h2').text('Screenshot');")
    end

    within('div#content') do
      expect(page).to have_css('h2', text: 'Screenshot')
    end
    page.save_screenshot(full: :true)
  end

  scenario 'and saving a copy' do
    list_gyms
    visit new_account_session_path
    within('div#content') do
      page.execute_script("$('h2').text('HTML copy');")
    end

    within('div#content') do
      expect(page).to have_css('h2', text: 'HTML copy')
    end
    save_page
  end
end