require 'faker'

User.create!(first_name: "Tom", last_name: "Thompson", cohort_animal: "Bobolinks", cohort_year: "2014", email: "tom@tom.com", password: "asdfasdf", password_confirmation: "asdfasdf")
User.create!(first_name: "John", last_name: "Johnson", cohort_animal: "Bobolinks", cohort_year: "2014", email: "john@john.com", password: "asdfasdf", password_confirmation: "asdfasdf")
User.create!(first_name: "Bob", last_name: "Bobson", cohort_animal: "Bobolinks", cohort_year: "2014", email: "bob@bob.com", password: "asdfasdf", password_confirmation: "asdfasdf")

50.times do
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_animal: ["Bobolinks", "Mantises", "Herons", "Salamanders", "Coyotes"].sample , cohort_year: "2014", email: Faker::Internet.email, password: "asdfasdf", password_confirmation: "asdfasdf")
end

100.times do
	Article.create(title: Faker::Company.catch_phrase, short_description: Faker::Lorem.sentence(2), body: Faker::Lorem.sentence(9), user_id: User.find(rand(1..50)).id)
end

100.times do
	Article.create(title: Faker::Company.catch_phrase, short_description: Faker::Lorem.sentence(2), url: Faker::Internet.url, user_id: rand(1..50))
end

1000.times do
	Comment.create(article_id: rand(1..200), user_id: rand(1..50), body: Faker::Lorem.sentence(6))
end

2000.times do
	vote = Vote.new(tally_type: "Article", tally_id: rand(1..200), user_id: rand(1..50))
	vote.save
end

4000.times do
	vote = Vote.new(tally_type: "Comment", tally_id: rand(1..1000), user_id: rand(1..50))
	vote.save
end