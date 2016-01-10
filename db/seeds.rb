
mustard = User.create( username: "ColonelMustard", password: "mustard" )
scarlett = User.create( username: "MissScarlett", password: "scarlett" )
plum = User.create( username: "ProfessorPlum", password: "plum" )
white = User.create( username: "MrsWhite", password: "white" )
peacock = User.create( username: "MsPeacock", password: "peacock" )
green = User.create( username: "MrGreen", password: "green" )

survey1 = Survey.create( name: "Monkeys",
                         description: "This is a cool survey about monkeys.",
                         user: mustard
                         )

    question1 = Question.create( content: "What's your favorite type of monkey?",
                                 survey: survey1
                                 )

         option1 = Option.create( content: "Space",
                                  question: question1
                                  )

         option2 = Option.create( content: "Earth",
                                  question: question1
                                  )

    question2 = Question.create( content: "Who's your favorite famous monkey?",
                                 survey: survey1
                                 )

          option3 = Option.create( content: "Caesar from Planet of the Apes",
                                  question: question2
                                  )

          option4 = Option.create( content: "Curious George",
                                  question: question2
                                  )

          option5 = Option.create( content: "Donald Trump",
                                  question: question2
                           )


survey2 = Survey.create( name: "Lite Beer",
                         description: "Share your feelings about watery brews.",
                         user: mustard
                         )

    question3 = Question.create( content: "What's the deal with lite beer?",
                                 survey: survey2
                                 )

        option6 = Option.create( content: "Tastes great!",
                                question: question3
                                )

        option7 = Option.create( content: "Less filling!",
                                question: question3
                                )


survey3 = Survey.create( name: "Favorite murder options",
                         description: "Share your feelings about watery brews.",
                         user: scarlett
                         )

    question4 = Question.create( content: "What is your weapon of choice?",
                                 survey: survey3
                                 )

        option8 = Option.create( content: "Lead pipe",
                                question: question4
                                )

        option9 = Option.create( content: "Candlestick",
                                question: question4
                                )

        option9 = Option.create( content: "Revolver",
                                question: question4
                                )

    question5 = Question.create( content: "What is the best location?",
                                 survey: survey3
                                 )

        option8 = Option.create( content: "Library",
                                question: question4
                                )

        option9 = Option.create( content: "Conservatory",
                                question: question4
                                )

        option9 = Option.create( content: "Billiards Room",
                                question: question4
                                )



