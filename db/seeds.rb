Author.destroy_all
Book.destroy_all
puts "All authors and books destroyed"

1000.times do
  author = Author.create!(name: Faker::Book.author)
  puts "Author #{author.name} created"
end


status = ["available", "unavailable", "reserved"]
book_titles = []
1000.times do
  # faker make sure title is unique
  begin
    title = Faker::Book.unique.title
  rescue Faker::UniqueGenerator::RetryLimitExceeded
    title = Faker::Book.title
  end
  book = Book.create!(name: title, status: status.sample, isbn: Faker::Code.isbn, author_id: Author.find(Author.pluck(:id).sample).id)
  puts "Book #{book.name} created"
end