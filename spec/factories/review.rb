FactoryBot.define do
  factory :review do
    title { "meh" }
    rating { 3 }
    content { "book was ok" }
    sequence(:user_name) {|n| "User #{n}"}
    book
  end

  factory :good_review, parent: :review do
    title { "good" }
    rating { 5 }
    content { "book was good" }
  end

  factory :bad_review, parent: :review do
    title { "bad" }
    rating { 1 }
    content { "book was bad" }
  end
end
