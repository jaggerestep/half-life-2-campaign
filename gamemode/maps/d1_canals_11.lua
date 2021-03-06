ALLOWED_VEHICLE = "Airboat"

NEXT_MAP = "d1_canals_12"


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
	if ( !game.SinglePlayer() ) then
	
		ents.FindByName( "brush_maproom_pclip" )[ 1 ]:Remove()
		ents.FindByName( "gate1" )[ 1 ]:Remove()
	
	end

end
hook.Add( "InitPostEntity", "HL2C_InitPostEntity", HL2C_InitPostEntity )


-- Accept input
function HL2C_AcceptInput( ent, input )

	if ( !game.SinglePlayer() && ( ent:GetName() == "relay_guncave_startgunmount" ) && ( string.lower( input ) == "enablerefire" ) ) then
	
		ALLOWED_VEHICLE = "Airboat Gun"
		PrintMessage( HUD_PRINTTALK, "You're now allowed to spawn the Airboat & Gun (F3)." )
	
	end

	if ( !game.SinglePlayer() && ( ent:GetName() == "door_guncave_entrance" ) && ( string.lower( input ) == "close" ) ) then
	
		return true
	
	end

	if ( !game.SinglePlayer() && ( ent:GetName() == "door_guncave_exit" ) && ( string.lower( input ) == "close" ) ) then
	
		return true
	
	end

end
hook.Add( "AcceptInput", "HL2C_AcceptInput", HL2C_AcceptInput )
