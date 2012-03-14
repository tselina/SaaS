class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	
	goodStrategies = ['r','s','p']
	usedStrategies = []
	gameHash = Hash.new(0)
	game.each do |person|
		person.each_slice(2) do |name, strategy|
			raise NoSuchStrategyError unless goodStrategies.include?(strategy.downcase)
			usedStrategies << strategy.downcase
			gameHash[strategy.downcase] = name
		end
	end
	
	winningStrategy = (usedStrategies.sort do |a,b| 
			if (a == "r" && b == "p") || (a == "s" && b == "r") || (a == "p" && b == "s")
				1
			else
				if (a == "p" && b == "r") || (a == "r" && b == "s") || (a == "s" && b == "p")
					-1
				else
					0
				end
			end
		end
	)[0]
	
	winningStrategyIndex = usedStrategies.index(winningStrategy)
	#puts "Game #{game}"
	#puts "Winner is: #{game[winningStrategyIndex]}"
	game[winningStrategyIndex]
end

#puts rps_game_winner([[ "Armando", "p" ], [ "Dave", "s" ]])
#puts rps_game_winner([[ "Armando", "r" ], [ "Dave", "s" ]])
#puts rps_game_winner([[ "Armando", "r" ], [ "Dave", "p" ]])
#puts rps_game_winner([[ "Armando", "r" ], [ "Dave", "r" ]])
#puts rps_game_winner([[ "Armando", "p" ], [ "Dave", "p" ]])
#puts rps_game_winner([[ "Armando", "s" ], [ "Dave", "s" ]])

=begin
def rps_tournament_winner(tournament)
	#game
	if tournament[0][0].respond_to?("each")
		tournament.each do |sub_tournament|
			puts "sub_tournament start ------>"
			#puts sub_tournament
			rps_tournament_winner(sub_tournament)
			puts "sub_tournament end   <------"
		end
#		rps_tournament_winner(
#			rps_tournament_winner(tournament[0])
#		)
	else 
		rps_game_winner(tournament)
	end
end
=end

def rps_tournament_winner(tournament)
	if tournament[0][0].is_a? String
		return rps_game_winner(tournament)
	end

	rps_game_winner [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])]
end
=begin
tournament = 
[
[
	[
		[ ["Armando1", "P"], ["Dave1", "P"] ],
		[ ["Richard1", "R"], ["Michael1", "S"] ],
	],
	[
		[ ["Allen1", "R"], ["Omer1", "P"] ],
		[ ["David E.1", "S"], ["Richard X.1", "P"] ]
	]
],

[
	[
		[ ["Armando", "P"], ["Dave", "P"] ],
		[ ["Richard", "R"], ["Michael", "S"] ],
	],
	[
		[ ["Allen", "R"], ["Omer", "P"] ],
		[ ["David E.", "S"], ["Richard X.", "P"] ]
	]
]
]
rps_tournament_winner(tournament)
=end