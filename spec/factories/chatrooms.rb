FactoryGirl.define do
    factory :chatroom do
        users {[FactoryGirl.create(:user)]}
        messages {[FactoryGirl.create(:message)]}
    end
end