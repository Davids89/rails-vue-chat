require 'rails_helper'

module LoginHelper
    def login!
        visit root_path
        print page.html
        print current_url
        fill_in "username", with: "aaa"
        click_button "Entrar"
    end
end
