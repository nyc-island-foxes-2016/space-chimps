
mustard = User.create( username: "ColonelMustard", password: "mustard" )
plum = User.create( username: "ProfessorPlum", password: "plum" )
scarlett = User.create( username: "MissScarlett", password: "scarlett" )

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


