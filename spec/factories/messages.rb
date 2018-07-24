FactoryGirl.define do
    factory :message do
        text "test"
        user { FactoryGirl.create(:user) }
    end
end