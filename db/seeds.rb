require 'faker'

User.create!(first_name: "Tom", last_name: "Thompson", cohort_animal: "Bobolinks", cohort_year: "2014", email: "tom@tom.com", password: "asdfasdf", password_confirmation: "asdfasdf")
User.create!(first_name: "John", last_name: "Johnson", cohort_animal: "Bobolinks", cohort_year: "2014", email: "john@john.com", password: "asdfasdf", password_confirmation: "asdfasdf")
User.create!(first_name: "Bob", last_name: "Bobson", cohort_animal: "Bobolinks", cohort_year: "2014", email: "bob@bob.com", password: "asdfasdf", password_confirmation: "asdfasdf")

50.times do
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_animal: ["Bobolinks", "Mantises", "Herons", "Salamanders", "Coyotes"].sample , cohort_year: "2014", email: Faker::Internet.email, password: "asdfasdf", password_confirmation: "asdfasdf")
end

100.times do
	article = Article.create(title: Faker::Company.catch_phrase, short_description: Faker::Lorem.sentence(2), body: Faker::Lorem.sentence(9), user_id: User.find(rand(1..50)).id)
	article.tag_list
end

phase_tags = ["phase0", "phase1", "phase2", "phase3", "alumni"]
general_tags = ["css", "html", "javascript", "ruby", "ajax", "webkit", "ux", "acts_as_taggable_on", "ruby_gems", "agile", "coffescript", "java", "jobs"]

100.times do
	article = Article.create(title: Faker::Company.catch_phrase, short_description: Faker::Lorem.sentence(2), url: Faker::Internet.url, user_id: rand(1..50))
	article.tag_list.add(phase_tags.sample)
	article.save
	article.tag_list.add(general_tags.sample(rand(1..8)).join(', '), parse: true)
	article.save
end

1000.times do
	Comment.create(article_id: rand(1..200), user_id: rand(1..50), body: Faker::Lorem.sentence(6))
end

2000.times do
	vote = Vote.new(tally_type: "Article", tally_id: rand(1..200), user_id: rand(1..50))
	vote.save
end

8000.times do
	vote = Vote.new(tally_type: "Comment", tally_id: rand(1..1000), user_id: rand(1..50))
	vote.save
end


