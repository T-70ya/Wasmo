FactoryBot.define do

  factory :content do
    title           {Faker::Movie.title}
    money           {10000}
    start_time      {Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)}
    association :user
  end
end