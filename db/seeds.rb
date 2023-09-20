Author.destroy_all
Book.destroy_all
puts "All authors and books destroyed"

100.times do
  author = Author.create!(name: Faker::Book.author)
  puts "Author #{author.name} created"
end


status = ["available", "unavailable", "reserved"]
book_titles = []
1000.times do
  begin
    try = 0
    image = URI.open(Faker::LoremFlickr.image(size: "300x300"))
  rescue Net::OpenTimeout => e
    puts e
    try += 1
    if try < 5
      puts "Timeout, retrying"
      retry
    else
      puts "Timeout, skipping"
      next
    end
  end

  blob = ActiveStorage::Blob.create_and_upload!(
    io: image,
    filename: "cover.jpg",
    content_type: "image/jpeg"
  )

  # faker make sure title is unique
  begin
    title = Faker::Book.unique.title
  rescue Faker::UniqueGenerator::RetryLimitExceeded
    title = Faker::Book.title
  end
  book = Book.create!(name: title, status: status.sample, isbn: Faker::Code.isbn, author_id: Author.find(Author.pluck(:id).sample).id, description: Faker::Lorem.paragraph(sentence_count: 50), cover: blob)
  puts "Book #{book.name} created"
end