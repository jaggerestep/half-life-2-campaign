NEXT_MAP = "d2_coast_01"

TRIGGER_DELAYMAPLOAD = { Vector( -1723, 10939, 904 ), Vector( -1638, 10995, 1010 ) }

TOWN_CREATE_NEW_SPAWNPOINT = true


-- Player spawns
function HL2C_PlayerSpawn( ply )

	ply:Give( "weapon_crowbar" )
	ply:Give( "weapon_pistol" )
	ply:Give( "weapon_smg1" )
	ply:Give( "weapon_357" )
	ply:Give( "weapon_frag" )
	ply:Give( "weapon_physcannon" )
	ply:Give( "weapon_shotgun" )

end
hook.Add( "PlayerSpawn", "HL2C_PlayerSpawn", HL2C_PlayerSpawn )


-- Initialize entities
function HL2C_InitPostEntity()

	ents.FindByName( "player_spawn_template" )[ 1 ]:Remove()
	if ( !game.SinglePlayer() ) then
	
		ents.FindByName( "trigger_close_door" )[ 1 ]:Remove()
	
	end

end
hook.Add( "InitPostEntity", "HL2C_InitPostEntity", HL2C_InitPostEntity )


-- Accept input
function HL2C_AcceptInput( ent, input )

	if ( !game.SinglePlayer() && TOWN_CREATE_NEW_SPAWNPOINT && ( ent:GetName() == "citizen_warehouse_door_1" ) && ( string.lower( input ) == "open" ) ) then
	
		TOWN_CREATE_NEW_SPAWNPOINT = false
		GAMEMODE:CreateSpawnPoint( Vector( -1160, 10122, 908 ), 90 )
	
	end

end
hook.Add( "AcceptInput", "HL2C_AcceptInput", HL2C_AcceptInput )
