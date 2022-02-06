extends Node

const DEVELOPMENT = true

enum ItemType {
	ITEM_BEAM,
	ITEM_MISSILE
}

enum ExplosionType {
	EXPLOSION_YELLOW_LARGE,
	EXPLOSION_YELLOW_MEDIUM,
	EXPLOSION_YELLOW_SMALL,
	EXPLOSION_HIT_YELLOW
}

var players = [PlayerStats.new()]
var lives: int = 2
var highscore: int = 150000

func start(players):
	self.players = Array()
	for i in range(players):
		self.players.append(PlayerStats.new())
