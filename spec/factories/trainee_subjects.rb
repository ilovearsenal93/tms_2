# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trainee_subject do
    trainee_id 1
    subject_id 1
    status "MyString"
    timecomplete "2014-07-14 14:28:28"
  end
end
