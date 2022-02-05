extends Node

enum ItemType {
	ITEM_BEAM
}

var players = [PlayerStats.new()]
var credits: int = 2
var highscore: int = 150000

func start(players):
	self.players = Array()
	for i in range(players):
		self.players.append(PlayerStats.new())
