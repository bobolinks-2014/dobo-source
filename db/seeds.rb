User.create!(email: "tom@tom.com", password: "asdfasdf", password_confirmation: "asdfasdf")

User.create!(email: "john@john.com", password: "asdfasdf", password_confirmation: "asdfasdf")

for i in 0..9
	Article.create(title: "article title #{i}", short_description: "short asdf description", body: "astadf asdf asdfasd asdfasdf asdf asdf", user_id: User.find_by(email: "john@john.com").id)
	
end