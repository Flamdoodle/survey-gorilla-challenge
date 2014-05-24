require 'faker'

pei = User.new(username: "pei")
ste = User.new(username: "ste")
users = [pei, ste]

users.each do |user|
  user.password = "yolo"
  user.save

  3.times do
    survey = Survey.create(title: Faker::Lorem.sentence)
    user.surveys << survey

    5.times do
      question = Question.create(survey_question: Faker::Lorem.sentence + "?")
      survey.questions << question

      4.times do
        choice = Choice.create(survey_choice: Faker::Lorem.word, tally: 0)
        question.choices << choice
      end
    end
  end
end
