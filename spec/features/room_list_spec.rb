require 'rails_helper'
require 'support/login_helper'

RSpec.feature "User enters in room list", type: :feature do
  include LoginHelper

  before do
    login!
  end

  scenario 'User enter in the room list screen', js: true do
    3.times { create :chatroom }
    visit '/#/rooms'
    expect(page).to have_selector('.chatroom-list')
    expect(page).to have_selector('.chatroom-element'), count: 3
  end
end
