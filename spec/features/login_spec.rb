require 'rails_helper'

RSpec.describe 'Signin', type: :feature do
  before do
    User.destroy_all
    FactoryBot.create(:user)
    visit(new_user_session_path)
  end

  scenario 'Username, Password and login button' do
    expect(page).to have_field('user_email')
    expect(page).to have_field('user_password')
    expect(page).to have_button('Sign In')
  end

  context 'Login Process' do
    scenario 'Redirect to the root page when the submit button is clicked with the correct username and password' do
      @user = User.first
      within 'form' do
        fill_in('user_email', with: @user.email)
        fill_in('user_password', with: 'secret')
      end
      click_button('Sign In')
      expect(page).to have_current_path(authenticated_root_path)
      expect(page).to have_content('This Month')
      expect(page).to have_content('EXPENSE SUMMARY')
    end
  end
end
