require 'rails_helper'

RSpec.feature "User can log in", type: :feature do

  scenario 'User logs in with his name', js: true do
    visit root_path
    fill_in "username", with: "username"
    click_button "Entrar"

    expect(page).to have_selector('.add-chat-button-wrapper')
  end

  scenario "User can't log in without a username", js: true do
    visit root_path
    click_button "Entrar"
    expect(page).to have_text "El nombre debe ser mayor de 2 caracteres"
  end
end