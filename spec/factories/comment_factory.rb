FactoryGirl.define do
  sequence :content do |n|
    "Comment #{n}, now with padding."
  end

  factory :comment do
    content 
    author  "Fred"
  end
end
