require 'rails_helper'

describe "Login", type: :feature do
  let(:user) { FactoryBot.create :user }

  context "with correct user and password" do
    specify 'I can login' do
      visit root_path
      fill_in "session_email",	with: user.email
      fill_in "session_password",	with: user.password
      click_button "Entrar"

      expect(current_path).to eq root_path
    end
  end

  context "with wrong user and password" do
    specify 'I can not login' do
      visit root_path
      fill_in "session_email",	with: user.email
      fill_in "session_password",	with: '1234'
      click_button "Entrar"

      expect(current_path).to eq session_path
    end
  end
end

