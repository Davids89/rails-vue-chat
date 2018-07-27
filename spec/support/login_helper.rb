require 'rails_helper'

module LoginHelper
    def login! with_capybara = false
      visit root_path
        fill_in "username", with: "aaa"
        click_button "Entrar"
    end
end
