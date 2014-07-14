# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assigned_task do
    trainee_id 1
    task_id 1
    status "MyString"
    timecomplete "2014-07-14 14:28:02"
  end
end
