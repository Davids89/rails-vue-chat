require 'rails_helper'
require 'support/login_helper'

RSpec.feature "login", type: :feature do
  include LoginHelper

  before do
    login!
  end

  scenario 'a', js: true do
    expect(true).to eq(true)
  end
end
