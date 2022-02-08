extends Node

const DEVELOPMENT = true

enum ItemType {
	ITEM_NONE,
	ITEM_BEAM,
	ITEM_MISSILE
}

enum BulletType {
	BULLET_RIELGUN,
	BULLET_MISSILE
}

enum EnemyBulletType {
	ENEMY_BULLET_RIELGUN
}

enum ExplosionType {
	EXPLOSION_YELLOW_LARGE,
	EXPLOSION_YELLOW_MEDIUM,
	EXPLOSION_YELLOW_SMALL,
	EXPLOSION_HIT_YELLOW,
	EXPLOSION_FIRE,
	EXPLOSION_FIRE_SMALL
}

enum AsteroidType {
	ASTEROID_LARGE,
	ASTEROID_MEDIUM,
	ASTEROID_SMALL
}

enum WeaponType {
	WEAPON_RIELGUN,
	WEAPON_MISSILE
}

var players = [PlayerStats.new()]
var lives: int = 2
var highscore: int = 150000

func start(players):
	self.players = Array()
	for i in range(players):
		self.players.append(PlayerStats.new())

var musicAudio = AudioStreamPlayer.new()

func playMusic(stream):
	self.musicAudio.stream = load(stream)
	self.musicAudio.play()
	add_child(self.musicAudio)

func stopMusic():
	self.musicAudio.stop()
