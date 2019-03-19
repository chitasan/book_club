AuthorBook.destroy_all
Review.destroy_all
User.destroy_all
Book.destroy_all
Author.destroy_all

s_king = Author.create(name: "Stephen King")
  stand = s_king.books.create(title: "The Stand", pages: 823, year: 1978, image:  "https://upload.wikimedia.org/wikipedia/en/9/96/The_Stand_cover.jpg")
  shining = s_king.books.create(title: "The Shining", pages: 447, year: 1977, image:  "https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Shiningnovel.jpg/220px-Shiningnovel.jpg")

coelho = Author.create(name: "Paulo Coelho")
  alchemist = coelho.books.create(title: "The Alchemist", pages: 163, year: 1988, image:  "https://pictures.abebooks.com/SABRA2015/18269767749.jpg")

martel = Author.create(name: "Yann Martel")
  pi = martel.books.create(title: "Life of Pi", pages: 354, year: 2001, image:  "https://upload.wikimedia.org/wikipedia/en/4/45/Life_of_Pi_cover.png")


wallace = Author.create(name: "David Foster Wallace")
  jest = wallace.books.create(title: "Infinite Jest", pages: 1079, year: 1996, image:  "https://upload.wikimedia.org/wikipedia/en/thumb/4/4f/Infinite_jest_cover.jpg/220px-Infinite_jest_cover.jpg")


orwell = Author.create(name: "George Orwell")
  farm = orwell.books.create(title: "Animal Farm", pages: 112, year: 1945, image:  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Animal_Farm_-_1st_edition.jpg/220px-Animal_Farm_-_1st_edition.jpg")
  four = orwell.books.create(title: "1984", pages: 328, year: 1949, image:  "https://prodimage.images-bn.com/pimages/9780451524935_p0_v3_s550x406.jpg")

atwood = Author.create(name: "Margaret Atwood")
  tale = atwood.books.create(title: "The Handmaid's Tale", pages: 311, year: 1985, image:  "https://prodimage.images-bn.com/pimages/9780808598299_p0_v3_s550x406.jpg")

rand = Author.create(name: "Ayn Rand")
  atlas = rand.books.create(title: "Atlas Shrugged", pages: 1168, year: 1957, image:  "https://cdn.theatlantic.com/assets/media/img/mt/2013/10/atlas-shrugged-sg-amazon/lead_large.jpg")

salinger = Author.create(name: "J.D. Salinger")
  rye = salinger.books.create(title: "The Catcher in the Rye", pages: 277, year: 1951, image:  "https://upload.wikimedia.org/wikipedia/en/thumb/3/32/Rye_catcher.jpg/220px-Rye_catcher.jpg")

golding = Author.create(name: "William Golding")
  flies = golding.books.create(title: "Lord of the Flies", pages: 248, year: 1954, image:  "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/LordOfTheFliesBookCover.jpg/220px-LordOfTheFliesBookCover.jpg")

tolkien = Author.create(name: "J. R. R. Tolkien")
  r_king = tolkien.books.create(title: "The Return of the King", pages: 416, year: 1955, image:  "https://i.pinimg.com/originals/b8/41/9a/b8419ab382635f1b05003f9cbcf88401.jpg")



s_king.auth
