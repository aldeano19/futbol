class DemoDataToDatabase < ActiveRecord::Migration[5.2]
  def change
    # Create test users
    u1 = User.create name: "Joann Job", email: "t1@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"
    u2 = User.create name: "Donnette Deck", email: "t2@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"
    u3 = User.create name: "Arminda Attebery", email: "t3@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"
    u4 = User.create name: "Rayna Ruddell", email: "t4@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"
    u5 = User.create name: "Coletta Colbert", email: "t5@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"
    u6 =User.create name: "Teresa Torgrimson", email: "t6@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"
    u7 = User.create name: "Moises Mattews", email: "t7@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"
    u8 = User.create name: "Kathlene Koen", email: "t8@test.com", password: "q1w2e3", password_confirmation: "q1w2e3"

    # Create test teams
    t1 = Team.create name: "Aonyx Blue", created_by_id: u8.id
    t2 = Team.create name: "Clawless Otter", created_by_id: u7.id
    t3 = Team.create name: "Vanessa Indica", created_by_id: u6.id
    t4 = Team.create name: "Xerus Crista", created_by_id: u6.id


    # Add players to Team One
    PlayerTeamR.create user_id: u1.id, team_id: t1.id
    PlayerTeamR.create user_id: u2.id, team_id: t1.id
    PlayerTeamR.create user_id: u3.id, team_id: t1.id

    PlayerTeamR.create user_id: u4.id, team_id: t2.id
    PlayerTeamR.create user_id: u5.id, team_id: t2.id
    PlayerTeamR.create user_id: u6.id, team_id: t2.id

    # Create a Game
    Game.create when: Time.zone.parse('2044-01-01 19:00'), where: "Grey Dom", teamA_id: t1.id, teamB_id: t2.id, format: "wild"
    Game.create when: Time.zone.parse('2044-01-03 19:00'), where: "Grey Dom", teamA_id: t1.id, teamB_id: t2.id, format: "wild"
    Game.create when: Time.zone.parse('2044-01-05 19:00'), where: "Grey Dom", teamA_id: t1.id, teamB_id: t2.id, format: "wild"



  end
end
