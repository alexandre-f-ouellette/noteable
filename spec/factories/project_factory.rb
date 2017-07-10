FactoryGirl.define do
  sequence(:name) { |n| "Product ##{n}" }
  sequence(:short_name) { |n| "proj#{n}"}

  factory :project_valid, class: Project do
    name
    short_name
    start_date Date.new()
    end_date Date.new(2027,11,11)
    description "This is a description"
  end

  factory :project_no_name, class: Project do
    short_name "proj2"
    start_date Date.new()
    end_date Date.new(2027,11,11)
    description "This is a description"
  end

  factory :project_duplicate_short_name, class: Project do
    name
    short_name "proj1"
    start_date Date.new()
    end_date Date.new(2027,11,11)
    description "This is a description"
  end

  factory :project_short_name_too_long, class: Project do
    name
    short_name "this-is-a-long-name-for-a-project-what-was-i-thinking"
    start_date Date.new()
    end_date Date.new(2027,11,11)
    description "This is a description"
  end
end
