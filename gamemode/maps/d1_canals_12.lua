ALLOWED_VEHICLE = "Airboat Gun"

NEXT_MAP = "d1_canals_13"


-- Player spawns
function HL2C_PlayerSpawn( ply )

	ply:Give( "weapon_crowbar" )
	ply:Give( "weapon_pistol" )
	ply:Give( "weapon_smg1" )
	ply:Give( "weapon_357" )

end
hook.Add( "PlayerSpawn", "HL2C_PlayerSpawn", HL2C_PlayerSpawn )


-- Initialize entities
function HL2C_InitPostEntity()

	ents.FindByName( "global_newgame_template" )[ 1 ]:Remove()

end
hook.Add( "InitPostEntity", "HL2C_InitPostEntity", HL2C_InitPostEntity )
