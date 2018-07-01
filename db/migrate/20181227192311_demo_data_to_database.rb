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
    PlayerTeamR.create user_id: u8.id, team_id: t1.id

    t2 = Team.create name: "Clawless Otter", created_by_id: u7.id
    PlayerTeamR.create user_id: u7.id, team_id: t2.id

    t3 = Team.create name: "Vanessa Indica", created_by_id: u6.id
    PlayerTeamR.create user_id: u6.id, team_id: t3.id

    t4 = Team.create name: "Xerus Crista", created_by_id: u6.id
    PlayerTeamR.create user_id: u6.id, team_id: t4.id



    # Add players to Team Oneheroku open
    PlayerTeamR.create user_id: u1.id, team_id: t1.id
    PlayerTeamR.create user_id: u2.id, team_id: t1.id
    PlayerTeamR.create user_id: u3.id, team_id: t1.id

    PlayerTeamR.create user_id: u4.id, team_id: t2.id
    PlayerTeamR.create user_id: u5.id, team_id: t2.id
    PlayerTeamR.create user_id: u6.id, team_id: t2.id


    # Create a Game
    formats = GameFormat.all
    Game.create scheduled_date: Time.zone.parse('2044-01-01 19:00'), where: "Grey Dom", team_a_id: t1.id, team_b_id: t2.id, game_format_id: formats[0].id
    Game.create scheduled_date: Time.zone.parse('2044-01-03 19:00'), where: "Grey Dom", team_a_id: t1.id, team_b_id: t2.id, game_format_id: formats[1].id
    Game.create scheduled_date: Time.zone.parse('2044-01-05 19:00'), where: "Grey Dom", team_a_id: t1.id, team_b_id: t2.id, game_format_id: formats[2].id

  end
end
