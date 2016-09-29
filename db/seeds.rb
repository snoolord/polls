# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.transaction do
  User.create(user_name: 'doublelift')
  User.create(user_name: 'qtpie')
  User.create(user_name: 'faker')
  User.create(user_name: 'aphromoo')

  Poll.create(title: 'league friendship survey', author_id:1,)
  Poll.create(title: 'pro survey', author_id:2,)
  Poll.create(title: 'kappa', author_id:3,)
  Poll.create(title: 'take this poll', author_id:4,)

  Question.create(text: 'who are you voting for', poll_id:1)
  Question.create(text: 'how to carry?', poll_id:2)
  Question.create(text: 'who wins worlds', poll_id:3)
  Question.create(text: 'what keyboard to buy?', poll_id:4)

  AnswerChoice.create(text:'hillary' , question_id: 1)
  AnswerChoice.create(text:'trump' , question_id: 1)
  AnswerChoice.create(text:'git gud' , question_id: 2)
  AnswerChoice.create(text:'buy boost' , question_id: 2)
  AnswerChoice.create(text:'skt' , question_id: 3)
  AnswerChoice.create(text:'rox' , question_id: 3)
  AnswerChoice.create(text:'k70' , question_id: 4)
  AnswerChoice.create(text:'ducky shine' , question_id: 4)

  Response.create(user_id: 1, answer_id: 1)
  Response.create(user_id: 1, answer_id: 2)
  Response.create(user_id: 1, answer_id: 5)
  Response.create(user_id: 1, answer_id: 7)
  Response.create(user_id: 2, answer_id: 2)
  Response.create(user_id: 2, answer_id: 4)
  Response.create(user_id: 2, answer_id: 6)
  Response.create(user_id: 2, answer_id: 8)
  Response.create(user_id: 3, answer_id: 1)
  Response.create(user_id: 3, answer_id: 3)
  Response.create(user_id: 3, answer_id: 6)
  Response.create(user_id: 3, answer_id: 8)
  Response.create(user_id: 4, answer_id: 2)
  Response.create(user_id: 4, answer_id: 4)
  Response.create(user_id: 4, answer_id: 5)
  Response.create(user_id: 4, answer_id: 7)
end
