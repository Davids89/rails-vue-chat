require 'rails_helper'
require 'support/login_helper'

RSpec.feature "User enters in room list", type: :feature do
  include LoginHelper

  before do
    login!
  end

  scenario 'User enter in the room list screen', js: true do
    visit '/#/rooms'
    # print page.body
    # expect(page).to have_css('.chatroom-list')
  end
end
