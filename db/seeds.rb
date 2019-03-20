AuthorBook.destroy_all
# Review.destroy_all
Book.destroy_all
Author.destroy_all

king = Author.create(name: "Stephen King")
  stand = king.books.create(title: "The Stand", pages: 823, pub_date: 1978, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/9/96/The_Stand_cover.jpg")
  shining = king.books.create(title: "The Shining", pages: 447, pub_date: 1977, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Shiningnovel.jpg/220px-Shiningnovel.jpg")

coelho = Author.create(name: "Paulo Coelho")
  alchemist = coelho.books.create(title: "The Alchemist", pages: 163, pub_date: 1988, book_cover_photo:  "https://pictures.abebooks.com/SABRA2015/18269767749.jpg")

martel = Author.create(name: "Yann Martel")
  pi = martel.books.create(title: "Life of Pi", pages: 354, pub_date: 2001, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/4/45/Life_of_Pi_cover.png")

wallace = Author.create(name: "David Foster Wallace")
  jest = wallace.books.create(title: "Infinite Jest", pages: 1079, pub_date: 1996, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/4/4f/Infinite_jest_cover.jpg/220px-Infinite_jest_cover.jpg")

orwell = Author.create(name: "George Orwell")
  farm = orwell.books.create(title: "Animal Farm", pages: 112, pub_date: 1945, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Animal_Farm_-_1st_edition.jpg/220px-Animal_Farm_-_1st_edition.jpg")
  four = orwell.books.create(title: "1984", pages: 328, pub_date: 1949, book_cover_photo:  "https://prodimage.images-bn.com/pimages/9780451524935_p0_v3_s550x406.jpg")

atwood = Author.create(name: "Margaret Atwood")
  tale = atwood.books.create(title: "The Handmaid's Tale", pages: 311, pub_date: 1985, book_cover_photo:  "https://prodimage.images-bn.com/pimages/9780808598299_p0_v3_s550x406.jpg")

rand = Author.create(name: "Ayn Rand")
  atlas = rand.books.create(title: "Atlas Shrugged", pages: 1168, pub_date: 1957, book_cover_photo:  "https://cdn.theatlantic.com/assets/media/img/mt/2013/10/atlas-shrugged-sg-amazon/lead_large.jpg")

salinger = Author.create(name: "J.D. Salinger")
  rye = salinger.books.create(title: "The Catcher in the Rye", pages: 277, pub_date: 1951, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/3/32/Rye_catcher.jpg/220px-Rye_catcher.jpg")

golding = Author.create(name: "William Golding")
  flies = golding.books.create(title: "Lord of the Flies", pages: 248, pub_date: 1954, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/LordOfTheFliesBookCover.jpg/220px-LordOfTheFliesBookCover.jpg")

tolkien = Author.create(name: "J. R. R. Tolkien")
  r_king = tolkien.books.create(title: "The Return of the King", pages: 416, pub_date: 1955, book_cover_photo:  "https://i.pinimg.com/originals/b8/41/9a/b8419ab382635f1b05003f9cbcf88401.jpg")

metz = Author.create(name: "Sandi Metz")
  ruby = metz.books.create(title: "Practical Object-Oriented Design in Ruby: An Agile Primer", pages: 273, pub_date: 2012, book_cover_photo:  "https://images-na.ssl-images-amazon.com/images/I/51lFbn3LPCL._SX381_BO1,204,203,200_.jpg")

  bottles = metz.books.create(title: "99 Bottles of OOP", pages: 270, pub_date: 2017, book_cover_photo:  "https://static1.squarespace.com/static/537c0374e4b0f52ed92942e6/t/5793c96e29687f134e799ac0/1469303271611/")

owen = Author.create(name: "Katrina Owen")
  AuthorBook.create(author: owen, book: bottles)
