FactoryBot.define do

  factory :plan do
    target           {10000}
    target_month     {Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)}
    association :user
  end
end