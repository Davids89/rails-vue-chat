require 'rails_helper'
require 'support/login_helper'

RSpec.feature "User enters in room list", type: :feature do
  include LoginHelper

  before do
    login!
  end

  scenario 'User enter in the room list screen', js: true do
    create :chatroom
    visit '/#/rooms'
    sleep 5
    print page.html
    expect(page).to have_selector('.chatroom-list')
    #expect(page).to have_selector('')
  end
end
