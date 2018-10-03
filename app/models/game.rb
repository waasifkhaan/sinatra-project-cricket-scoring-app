class Game < ActiveRecord::Base
  belongs_to :user
  has_many :scores

  # def scores(params)
  #   scores = params.map do |player|
  #     @game = Game.find
  #     @player = Player.find_by(id: player[0])
  #     @score = Score.new(run: player[1])
  #     @score.player_id = @player.id
  #     @score.game_id = @game.id
  #     @score.save
  #   end
  #   scores
  # end

end
