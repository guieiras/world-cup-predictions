require 'rails_helper'

describe "Sign Up", type: :feature do
  context "when I don't have an account" do
    let(:user) { FactoryBot.build :user }

    specify 'I can sign up' do
      visit sign_up_path

      fill_in "user_name",	with: user.name
      fill_in "user_email",	with: user.email
      fill_in "user_password",	with: user.password
      click_button "Registrar-se"

      expect(User.count).to eq 1
      expect(current_path).to eq root_path
      expect(page).to have_content user.name
    end
  end
end

