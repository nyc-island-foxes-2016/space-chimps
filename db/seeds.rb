include Faker

User.create( username: "ColonelMustard", password: "mustard" )
User.create( username: "ProfessorPlum", password: "profplum" )
User.create( username: "MissScarlett", password: "scarlett" )

Thing.create( name: "pipe",
              description: "a 2-foot length of cast-iron pipe",
              user_id: 1
              )
Thing.create( name: "candlestick",
              description: "a heavy, silver-plated candlestick",
              user_id: 2
              )
Thing.create( name: "rope",
              description: "ten feet of heavy, hemp rope",
              user_id: 3
              )
Thing.create( name: "revolver",
              description: "a heavy-caliber pistol",
              user_id: 1
              )
Thing.create( name: "knife",
              description: "a keen double-edged blade",
              user_id: 2
              )
Thing.create( name: "poison",
              description: "a lethal brew smelling vaguely of almonds",
              user_id: 3
              )