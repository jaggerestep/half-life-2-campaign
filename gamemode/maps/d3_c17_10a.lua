INFO_PLAYER_SPAWN = { Vector( -3931, 6784, 5 ), 0 }

NEXT_MAP = "d3_c17_10b"


-- Player spawns
function HL2C_PlayerSpawn( ply )

	ply:Give( "weapon_crowbar" )
	ply:Give( "weapon_pistol" )
	ply:Give( "weapon_smg1" )
	ply:Give( "weapon_357" )
	ply:Give( "weapon_frag" )
	ply:Give( "weapon_physcannon" )
	ply:Give( "weapon_shotgun" )
	ply:Give( "weapon_ar2" )
	ply:Give( "weapon_rpg" )
	ply:Give( "weapon_crossbow" )
	ply:Give( "weapon_bugbait" )

end
hook.Add( "PlayerSpawn", "HL2C_PlayerSpawn", HL2C_PlayerSpawn )


-- Initialize entities
function HL2C_InitPostEntity()

	ents.FindByName( "player_spawn_items_maker" )[ 1 ]:Remove()

	local barney = ents.Create( "npc_barney" )
	barney:SetPos( Vector( -3588, 6994, 1 ) )
	barney:SetAngles( Angle( 0, -90, 0 ) )
	barney:SetName( "barney" )
	barney:SetKeyValue( "additionalequipment", "weapon_ar2" )
	barney:SetKeyValue( "spawnflags", "4" )
	barney:SetKeyValue( "squadname", "player_squad" )
	barney:Spawn()
	barney:Activate()

end
hook.Add( "InitPostEntity", "HL2C_InitPostEntity", HL2C_InitPostEntity )


-- Accept input
function HL2C_AcceptInput( ent, input )

	if ( !game.SinglePlayer() && ( ent:GetName() == "first_turret_relay" ) && ( string.lower( input ) == "trigger" ) ) then
	
		ents.FindByName( "barney" )[ 1 ]:SetLastPosition( Vector( -3305.125488, 7036.965332, 128.03125 ) )
		ents.FindByName( "barney" )[ 1 ]:SetSchedule( SCHED_FORCED_GO_RUN )
	
	end

	if ( !game.SinglePlayer() && ( ent:GetName() == "barney_nexusahead_lcs_relay" ) && ( string.lower( input ) == "trigger" ) ) then
	
		ents.FindByName( "barney" )[ 1 ]:SetLastPosition( Vector( -2579.804443, 6482.348633, 512.03125 ) )
		ents.FindByName( "barney" )[ 1 ]:SetSchedule( SCHED_FORCED_GO_RUN )
	
	end

	if ( !game.SinglePlayer() && ( ent:GetName() == "detected_relay" ) && ( string.lower( input ) == "trigger" ) ) then
	
		ents.FindByName( "barney" )[ 1 ]:SetLastPosition( Vector( -2842.493408, 8015.20752, 128.03125 ) )
		ents.FindByName( "barney" )[ 1 ]:SetSchedule( SCHED_FORCED_GO_RUN )
	
	end

end
hook.Add( "AcceptInput", "HL2C_AcceptInput", HL2C_AcceptInput )
