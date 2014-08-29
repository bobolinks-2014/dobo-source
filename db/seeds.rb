user = User.create(email: "John@john.com", password: "asdfasdf", password_confirmation: "asdfasdf")
article = Article.create(user_id: user.id, title: "article title", short_description: "short asdf description", body: "astadf asdf asdfasd asdfasdf asdf asdf")
comment = Comment.create(user_id: user.id, article: article, body: "this is a comment")
