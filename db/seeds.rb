require 'faker'

pei = User.new(username: "pei")
ste = User.new(username: "stephen")
bev = User.new(username: "beverly")
ryan = User.new(username: "ryan")
users = [pei, ste, bev, ryan]

users.each do |user|
  user.password = "yolo"
  user.save

  2.times do
    survey = Survey.create(title: Faker::Lorem.sentence, completed: true)
    user.surveys << survey

    5.times do
      question = Question.create(survey_question: Faker::Lorem.sentence + "?")
      survey.questions << question

      4.times do
        choice = Choice.create(survey_choice: Faker::Lorem.word, tally: rand(100))
        question.choices << choice
      end
    end
  end
end


users.each do |user|
  2.times do
    survey = Survey.create(title: Faker::Lorem.sentence, completed: true)
    user.surveys << survey

    5.times do
      question = Question.create(survey_question: Faker::Lorem.sentence + "?")
      survey.questions << question

      4.times do
        choice = Choice.create(survey_choice: Faker::Lorem.word, tally: rand(100))
        question.choices << choice
      end
    end
  end
end
