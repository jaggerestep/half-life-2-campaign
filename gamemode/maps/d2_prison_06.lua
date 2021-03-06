NEXT_MAP = "d2_prison_07"

TRIGGER_CHECKPOINT = {
	{ Vector( 1415, 595, -192 ), Vector( 1456, 757, -31 ) }
}


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

	ents.FindByName( "global_newgame_template_ammo" )[ 1 ]:Remove()
	ents.FindByName( "global_newgame_template_base_items" )[ 1 ]:Remove()
	ents.FindByName( "global_newgame_template_local_items" )[ 1 ]:Remove()
	if ( !game.SinglePlayer() ) then
	
		ents.FindByName( "pClip_introom_door_1" )[ 1 ]:Remove()
	
	end

end
hook.Add( "InitPostEntity", "HL2C_InitPostEntity", HL2C_InitPostEntity )


-- Accept input
function HL2C_AcceptInput( ent, input, activator, caller, value )

	if ( !game.SinglePlayer() && ( ent:GetName() == "lcs_np_meetup03" ) && ( string.lower( input ) == "resume" ) ) then
	
		for _, ply in pairs( player.GetAll() ) do
		
			ply:SetVelocity( Vector( 0, 0, 0 ) )
			ply:SetPos( Vector( 1570, 706, -680 ) )
			ply:SetEyeAngles( Angle( 0, -180, 0 ) )
		
		end
	
	end

	if ( !game.SinglePlayer() && ( ent:GetName() == "introom_door_1" ) && ( string.lower( input ) == "setanimation" ) && ( value == "close" ) ) then
	
		return true
	
	end

	if ( !game.SinglePlayer() && ( ( ent:GetName() == "door_controlroom_1" ) || ( ent:GetName() == "door_room1_gate" ) ) && ( string.lower( input ) == "close" ) ) then
	
		return true
	
	end

end
hook.Add( "AcceptInput", "HL2C_AcceptInput", HL2C_AcceptInput )
