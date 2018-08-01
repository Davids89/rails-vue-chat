require 'rails_helper'
require 'support/login_helper'

RSpec.feature "User creates room", type: :feature do
  include LoginHelper

  before do
    login!
  end

  scenario 'User open modal and create room', js: true do
    create :chatroom
    room_name = "room"

    visit '/#/rooms'
    click_on "Nueva sala"

    fill_in  "room_name", with: room_name
    click_on "Guardar"
    expect(page).to have_text room_name
  end

  scenario 'User open modal but not fill name input and the modal is not closed', js: true do
    visit '/#/rooms'
    click_on "Nueva sala"

    click_on "Guardar"
    expect(page).to have_selector('.modal-mask')
  end

  scenario 'User close the modal without create room', js: true do
    visit '/#/rooms'
    click_on "Nueva sala"

    click_on "Cancelar"
    expect(page).not_to have_selector('.modal-mask')
  end
end
