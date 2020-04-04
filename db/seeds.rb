# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {name: "Vanya"},
  {name: "Petya"}
])

Category.create([
  {title: "Programming"},
  {title: "History"},
  {title: "Geography"}
])

Test.create([
  {title: "HTML", category_id: 1},
  {title: "Javascript", category_id: 1, level: 1},
  {title: "React", category_id: 1, level: 2},
  {title: "Ancient Rome", category_id: 2, level: 1},
  {title: "Cities", category_id: 3, level: 1}
])

Question.create([
  {body: "What does 'HTML' means?", test_id: 1},
  {body: "What is the name of the most famous Rome commander who has been brutally killed?", test_id: 4},
  {body: "Main city in the most north-west subject of Russian Federation.", test_id: 5},
  {body: "What is the main uniqueness of Kaliningrad?", test_id: 5}
])

Answer.create([
  {body: "Hyper Text Markup Language", question_id: 1, correct: true},
  {body: "Hypno Tantra Modern Lavazza", question_id: 1, correct: false},
  {body: "Caezar", question_id: 2, correct: true},
  {body: "Michael Jackson", question_id: 2, correct: false},
  {body: "Kaliningrad", question_id: 3, correct: true},
  {body: "Berlin", question_id: 3, correct: false},
  {body: "Amber", question_id: 4, correct: true},
  {body: "Curonian Spit", question_id: 4, correct: false}
])

UserTest.create([
  {result: "In process", user_id: 1, test_id: 1},
  {result: "Failed", user_id: 1, test_id: 2},
  {result: "Passed", user_id: 1, test_id: 3}
])
