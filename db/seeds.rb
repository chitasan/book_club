AuthorBook.destroy_all
# Review.destroy_all
Book.destroy_all
Author.destroy_all

king = Author.create(name: "Stephen King")
  stand = king.books.create(title: "The Stand", pages: 823, pub_date: 1978, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/9/96/The_Stand_cover.jpg")
    review_1 = stand.reviews.create(title: "Awesome Book", rating: 5, content: "One of King's best book, what a plot!", user_name: "Charles")
    review_2 = stand.reviews.create(title: "Confusing", rating: 2, content: "Too long, I lost interest.", user_name: "Cullen")
  shining = king.books.create(title: "The Shining", pages: 447, pub_date: 1977, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Shiningnovel.jpg/220px-Shiningnovel.jpg")
    review_3 = shining.reviews.create(title: "SCARY", rating: 3, content: "I slept with the lights on for a week.", user_name: "Jack")
    review_4 = shining.reviews.create(title: "It's okay", rating: 2, content: "The movie was much better.", user_name: "Wendy")
    review_5 = shining.reviews.create(title: "Wow", rating: 5, content: "This will be a classic.", user_name: "Danny")
    

coelho = Author.create(name: "Paulo Coelho")
  alchemist = coelho.books.create(title: "The Alchemist", pages: 163, pub_date: 1988, book_cover_photo:  "https://pictures.abebooks.com/SABRA2015/18269767749.jpg")
    review_6 = alchemist.reviews.create(title: "Philosophically intriguing", rating: 4, content: "I can see why it remains a bestseller.", user_name: "John Galt")
    review_7 = alchemist.reviews.create(title: "Laughable", rating: 2, content: "Is this a soap opera? What a self-serving dribble.", user_name: "Avril")

martel = Author.create(name: "Yann Martel")
  pi = martel.books.create(title: "Life of Pi", pages: 354, pub_date: 2001, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/4/45/Life_of_Pi_cover.png")
    review_8 = pi.reviews.create(title: "Beyond a tale of a boy, a boat, and a tiger.", rating: 5, content: "He manages to tell the same man v. nature story in a new fashion.", user_name: "Cullen")
    review_9 = pi.reviews.create(title: "Sorry I took the time to read it.", rating: 2, content: "This is a fantasy I could have done without. No redeeming quality.", user_name: "Jack")

wallace = Author.create(name: "David Foster Wallace")
  jest = wallace.books.create(title: "Infinite Jest", pages: 1079, pub_date: 1996, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/4/4f/Infinite_jest_cover.jpg/220px-Infinite_jest_cover.jpg")
    review_10 = jest.reviews.create(title: "Fascinating and deeply compelling.", rating: 5, content: "I rarely reread something twice but this I did, and will likely read again.", user_name: "Wendy")
    review_11 = jest.reviews.create(title: "A lukewarm story from an otherwise amazing author.", rating: 3, content: "I prefer his short stories and essays. He certainly masters the extreme run-on sentence.", user_name: "Rita")

orwell = Author.create(name: "George Orwell")
  farm = orwell.books.create(title: "Animal Farm", pages: 112, pub_date: 1945, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Animal_Farm_-_1st_edition.jpg/220px-Animal_Farm_-_1st_edition.jpg")
    review_12 = farm.reviews.create(title: "Compelling", rating: 4, content: "Compelling story with relatable characters with layers of political commentary", user_name: "Old Major")
    review_13 = farm.reviews.create(title: "Exceeded Expectations", rating: 5, content: "This book affected me for a long time", user_name: "Avril")
    review_14 = farm.reviews.create(title: "I checked the bucket list", rating: 3, content: "Not as profound as I had imagined", user_name: "John Galt")
  four = orwell.books.create(title: "1984", pages: 328, pub_date: 1949, book_cover_photo:  "https://prodimage.images-bn.com/pimages/9780451524935_p0_v3_s550x406.jpg")
    review_15 = four.reviews.create(title: "More relevant than ever today", rating: 5, content: "The book has remained the same, but the world has not; it is genuinely very freightening!", user_name: "Danny")
    review_16 = four.reviews.create(title: "Too negative", rating: 3, content: "The view of the world, according to the author, is too negative for me.", user_name: "Cullen")

atwood = Author.create(name: "Margaret Atwood")
  tale = atwood.books.create(title: "The Handmaid's Tale", pages: 311, pub_date: 1985, book_cover_photo:  "https://prodimage.images-bn.com/pimages/9780808598299_p0_v3_s550x406.jpg")
    review_17 = tale.reviews.create(title: "Not dated", rating: 4, content: "Young women and men everywhere should read this.", user_name: "Wendy")
    review_18 = tale.reviews.create(title: "Extremities gone too far", rating: 2, content: "Disgusted. Not sure why this is a bestseller.", user_name: "Jack")

ayn = Author.create(name: "Ayn Rand")
  atlas = ayn.books.create(title: "Atlas Shrugged", pages: 1168, pub_date: 1957, book_cover_photo:  "https://cdn.theatlantic.com/assets/media/img/mt/2013/10/atlas-shrugged-sg-amazon/lead_large.jpg")
    review_19 = atlas.reviews.create(title: "Thought Provoking", rating: 4, content: "Dystopian novel that combines economics, sci-fic, philosphy, while keeping intrigue.", user_name: "Charles")  
    review_20 = atlas.reviews.create(title: "Too Long", rating: 3, content: "I may have liked it more if it wasn't so long. Who has the time?", user_name: "Old Major")
    review_21 = atlas.reviews.create(title: "Remarkable", rating: 4, content: "This is much more enjoyable than The Fountainhead.", user_name: "Rita")

salinger = Author.create(name: "J.D. Salinger")
  rye = salinger.books.create(title: "The Catcher in the Rye", pages: 277, pub_date: 1951, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/3/32/Rye_catcher.jpg/220px-Rye_catcher.jpg")
    review_22 = rye.reviews.create(title: "Relatable but...", rating: 3, content: "too many tangents due to Holden's wandering means.", user_name: "Jack")
    review_23 = rye.reviews.create(title: "This was a banned book.", rating: 4, content: "Was banned for its honesty and themes that don't shy away from realistic scenarios.", user_name: "Ralph")

golding = Author.create(name: "William Golding")
  flies = golding.books.create(title: "Lord of the Flies", pages: 248, pub_date: 1954, book_cover_photo:  "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/LordOfTheFliesBookCover.jpg/220px-LordOfTheFliesBookCover.jpg")
    review_24 = flies.reviews.create(title: "A Timeless Treasure", rating: 5, content: "One of the greatest American horror stories of all time. Epic.", user_name: "Avril")
    review_25 = flies.reviews.create(title: "Not for me", rating: 1, content: "Cumbersome and slow in plot.", user_name: "Old Major")

tolkien = Author.create(name: "J. R. R. Tolkien")
  r_king = tolkien.books.create(title: "The Return of the King", pages: 416, pub_date: 1955, book_cover_photo:  "https://i.pinimg.com/originals/b8/41/9a/b8419ab382635f1b05003f9cbcf88401.jpg")
      review_26 = r_king.reviews.create(title: "Epic fantasy by the master", rating: 5, content: "I'm late to the party, but am glad I arrived. So easy to fall in love with the stories and characters.", user_name: "Ralph")
      review_27 = r_king.reviews.create(title: "Not what I expected, but good", rating: 4, content: "Good in it's own rights even though it didn't meet my expectations. Most likely my fault for setting false expectations in the first place.", user_name: "Danny")


metz = Author.create(name: "Sandi Metz")
  ruby = metz.books.create(title: "Practical Object-Oriented Design in Ruby: An Agile Primer", pages: 273, pub_date: 2012, book_cover_photo:  "https://images-na.ssl-images-amazon.com/images/I/51lFbn3LPCL._SX381_BO1,204,203,200_.jpg")
    review_28 = ruby.reviews.create(title: "What?", rating: 2, content: "Not sure why this book is included in the book club, but I guess we could use more than fiction? Maybe when I have time, I'll learn about programming.", user_name: "Avril")
    review_29 = ruby.reviews.create(title: "Interesting...", rating: 3, content: "I got the wrong book! But my son, who's in coding bootcamp put it to good use and enjoyed it.", user_name: "Danny")

  bottles = metz.books.create(title: "99 Bottles of OOP", pages: 270, pub_date: 2017, book_cover_photo:  "https://static1.squarespace.com/static/537c0374e4b0f52ed92942e6/t/5793c96e29687f134e799ac0/1469303271611/")
    review_30 = bottles.reviews.create(title: "Not a mixology book.", rating: 4, content: "I went into this thinking it was a book on beer, but it is not. I finished it anyway and found the logic interesting.", user_name: "Ralph")

owen = Author.create(name: "Katrina Owen")
  AuthorBook.create(author: owen, book: bottles)

