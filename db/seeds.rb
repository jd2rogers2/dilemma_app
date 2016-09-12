# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "user_1@email.com", password: "user_1")
Dilemma.create(name: "what to have for lunch", user_id: 1)
Option.create(name: "homemade turkey sandwhich", dilemma_id: 1)
Option.create(name: "chipotle", dilemma_id: 1)
Factor.create(name: "it's free", option_id: 1, points: 50)
Factor.create(name: "it tatses ok", option_id: 1, points: 10)
Factor.create(name: "i had chipotle 1 day ago", option_id: 2, points: -10)
Factor.create(name: "i had chipotle 2 days ago", option_id: 2, points: -10)
Factor.create(name: "i had chipotle 3 days ago", option_id: 2, points: -10)
Factor.create(name: "i love chipotle", option_id: 2, points: 100)

User.create(email: "user_2@email.com", password: "user_2")
Dilemma.create(name: "what to do for our anniversary", user_id: 2)
Option.create(name: "mexican restaurant", dilemma_id: 2)
Option.create(name: "italian restaurant", dilemma_id: 2)
Option.create(name: "movies", dilemma_id: 2)
Factor.create(name: "tequila", option_id: 3, points: 50)
Factor.create(name: "tacos", option_id: 3, points: 50)
Factor.create(name: "not too pricey", option_id: 3, points: 40)
Factor.create(name: "we go out for mexican too much", option_id: 3, points: -10)
Factor.create(name: "somewhat pricey", option_id: 4, points: -10)
Factor.create(name: "i love italian", option_id: 4, points: 25)
Factor.create(name: "she does not love italian", option_id: 4, points: -25)
Factor.create(name: "movies are expensive these days", option_id: 5, points: -20)
Factor.create(name: "the movies out now are shit", option_id: 5, points: -25)
Factor.create(name: "big comfy chairs", option_id: 5, points: 25)
Factor.create(name: "i have a gift card", option_id: 5, points: 50)

Dilemma.create(name: "what to be for halloween", user_id: 2)
Option.create(name: "snap chat filters", dilemma_id: 3)
Option.create(name: "trump", dilemma_id: 3)
Option.create(name: "eggplant emoji", dilemma_id: 3)
Factor.create(name: "creative", option_id: 6, points: 50)
Factor.create(name: "current", option_id: 6, points: 50)
Factor.create(name: "might be hard to do/carry all of them around", option_id: 6, points: -10)
Factor.create(name: "i really hate that guy", option_id: 7, points: -50)
Factor.create(name: "this will likely be a common costume", option_id: 7, points: -20)
Factor.create(name: "extra funny", option_id: 8, points: 50)
Factor.create(name: "very hard to do", option_id: 8, points: -15)

Tag.create(name: "common dilemmas")
Tag.create(name: "holidays")
Tag.create(name: "girlfriend stuff")
DilemmaTag.create(tag_id: 1, dilemma_id: 1)
DilemmaTag.create(tag_id: 2, dilemma_id: 2)
DilemmaTag.create(tag_id: 3, dilemma_id: 2)
DilemmaTag.create(tag_id: 2, dilemma_id: 3)
DilemmaTag.create(tag_id: 1, dilemma_id: 3)

