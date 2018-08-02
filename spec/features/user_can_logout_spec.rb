require 'rails_helper'
require 'support/login_helper'

RSpec.feature "User can logout", type: :feature do

    include LoginHelper

    before do
        login
    end

    scenario "User can logout clicking in one button", js: :true do
        visit '/#/rooms'

        click_on "Salir"
        expect(page).not_to have_selector('.header')
        expect(page).to have_selector('.login-wrapper')
    end

end