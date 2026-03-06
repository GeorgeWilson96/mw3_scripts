#include maps/_1564
#include maps/_1571
#include maps/_1574

init ()

level_boss_ally_behavior_change()
{
    level waittill( "wave_started")
      wait 2;

    var_1 = getaiarray( "allies" );

    foreach ( var_3 in var_1 )
    {
        if ( isalive( var_3 ) && isdefined( var_3.owner ) && var_3.owner == self )
            return 0;
             iprintln("hello")
    }

    {
         var_0 = getaiarray( "axis" );

     if ( isdefined( level._id_3D64 ) && level._id_3D64.size )
        var_0 = maps\_utility::_id_1843( var_0, level._id_3D64 );

     var_0 = maps\_utility::_id_1843( var_0, _id_3DC4() );
     return var_0;
    
    
     if ( isalive (jug_regular,jug_headshot,jug_explosive,jug_MW2) )
         return 1;
    }
      iprintln("Enemy Juggernaut Detected Switching Combat Mode To 'Assault'");
}