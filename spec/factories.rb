require 'factory_girl_rails'
FactoryGirl.define do
  factory :user do
    name "ljm"
    email "ljm@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
