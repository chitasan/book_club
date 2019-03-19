FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Book #{n}"}
    pages { 300 }
    sequence(:pub_date) {|n| ("#{n}".to_i+2000)}
    book_cover_photo { "https://upload.wikimedia.org/wikipedia/en/9/96/The_Stand_cover.jpg" }
  end

  factory :short_book, parent: :book do
    pages { 150 }
  end

  factory :long_book, parent: :book do
    pages { 450 }
  end
end
