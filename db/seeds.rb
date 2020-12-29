# frozen_string_literal: true

admin = Admin.create(email: 'admin@example.com', password: 'password')

Survey.create(name: "Sample set of questions",
              admin: admin,
              questions_attributes: [
                {
                  body: "Which answer is correct?",
                  answers_attributes: [
                    { body: "1", correct: false },
                    { body: "2", correct: true },
                    { body: "3", correct: false }
                  ],
                },
                {
                  body: "Which answer is the longest?",
                  answers_attributes: [
                    { body: "This", correct: false },
                    { body: "This one", correct: false },
                    { body: "This one, of course", correct: true }
                  ]
                }
              ])
