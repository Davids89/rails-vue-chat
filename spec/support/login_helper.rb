require 'rails_helper'

module LoginHelper
    def login!
        visit "http://localhost:3000/#/login"
        print page.html
        print current_url
        fill_in "username", with: "aaa"
        click_button "Entrar"
    end
end
