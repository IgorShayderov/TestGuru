# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def row_id_by_attr_value(table, attr, value)
  table.select { |table_row| table_row[attr] == value }.first.id
end

users = User.create!([
  {name: "Vanya"},
  {name: "Petya"}
])

categories = Category.create!([
  {title: "Programming"},
  {title: "History"},
  {title: "Geography"}
])

programming_id = row_id_by_attr_value(categories, :title, "Programming")
history_id = row_id_by_attr_value(categories, :title, "History")
cities_id = row_id_by_attr_value(categories, :title, "Geography")

tests = Test.create!([
  {title: "HTML", category_id: programming_id},
  {title: "Javascript", category_id: programming_id, level: 1},
  {title: "React", category_id: programming_id, level: 2},
  {title: "Ancient Rome", category_id: history_id, level: 1},
  {title: "Cities", category_id: cities_id, level: 1}
])

html_test_id = row_id_by_attr_value(tests, :title, "HTML")
js_test_id = row_id_by_attr_value(tests, :title, "Javascript")
react_test_id = row_id_by_attr_value(tests, :title, "React")
ancient_rome_test_id = row_id_by_attr_value(tests, :title, "Ancient Rome")
cities_id = row_id_by_attr_value(tests, :title, "Cities")

html_means_q_body = "What does 'HTML' means?"
rome_caezar_q_body = "What is the name of the most famous Rome commander who has been brutally killed?"
kgd_rf_subj_q_body = "Main city in the most north-west subject of Russian Federation."
kgd_uniq_q_body = "What is the main uniqueness of Kaliningrad?"

questions = Question.create!([
  {body: html_means_q_body, test_id: html_test_id},
  {body: rome_caezar_q_body, test_id: ancient_rome_test_id},
  {body: kgd_rf_subj_q_body, test_id: cities_id},
  {body: kgd_uniq_q_body, test_id: cities_id}
])

html_means_q_id = row_id_by_attr_value(questions, :body, html_means_q_body)
rome_caezar_q_id = row_id_by_attr_value(questions, :body, rome_caezar_q_body)
kgd_rf_subj_q_id = row_id_by_attr_value(questions, :body, kgd_rf_subj_q_body)
kgd_uniq_q_id = row_id_by_attr_value(questions, :body, kgd_uniq_q_body)

Answer.create!([
  {body: "Hyper Text Markup Language", question_id: html_means_q_id, correct: true},
  {body: "Hypno Tantra Modern Lavazza", question_id: html_means_q_id, correct: false},
  {body: "Caezar", question_id: rome_caezar_q_id, correct: true},
  {body: "Michael Jackson", question_id: rome_caezar_q_id, correct: false},
  {body: "Kaliningrad", question_id: kgd_rf_subj_q_id, correct: true},
  {body: "Berlin", question_id: kgd_rf_subj_q_id, correct: false},
  {body: "Amber", question_id: kgd_uniq_q_id, correct: true},
  {body: "Curonian Spit", question_id: kgd_uniq_q_id, correct: false}
])

vanya = row_id_by_attr_value(users, :name, "Vanya")
petya = row_id_by_attr_value(users, :name, "Petya")

UserTest.create!([
  {result: "In process", user_id: vanya, test_id: html_test_id},
  {result: "Failed", user_id: vanya, test_id: js_test_id},
  {result: "Passed", user_id: vanya, test_id: react_test_id}
])
