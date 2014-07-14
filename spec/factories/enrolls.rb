# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :enroll do
    trainee_id 1
    course_id 1
    status "MyString"
    timecomplete "2014-07-14 14:28:16"
  end
end
