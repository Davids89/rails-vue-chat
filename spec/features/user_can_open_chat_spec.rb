require 'rails_helper'
require 'support/login_helper'

RSpec.feature "User can open a chat", type: :feature do

    include LoginHelper

    before do
        login
    end

    scenario 'User open a chat clicking in one of the list', js: :true do
        create :chatroom

        visit '/#/rooms'
        find('.chatroom-card').trigger('click')
        expect(page).not_to have_selector('.new-room-button')
    end
end