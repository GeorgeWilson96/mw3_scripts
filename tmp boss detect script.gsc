main() {
  iprintlnbold("Main ran !");
  thread check_allies_spawned();
  thread set_ai();
}
check_allies_spawned(){
  level notify("juggernaut_jumpedout");
  wait 20;
  iprintlnbold("Juggernaut jumped");
  allies = getaiarray( "allies" );
  // Temp hack should be 0
  is_ally_alive = 1;
  println(allies);
  foreach ( ally in allies )
  {
      if ( isalive( ally ) && isdefined( ally.owner ) && ally.owner == self ) { 
        is_ally_alive = 1;
        break;
      }
  }
  if (is_ally_alive == 1) {
    iprintlnbold("hello " + allies.size);
    foreach ( ally in allies ) {
      ally thread allyEvents();
    }
  }
}
allyEvents(){
  while(true){
    wait 1;
    iprintlnbold(self.name + "- Juggernaut " + (self.health / self.maxhealth) * 100 + "%");
    if (isalive( self )) {
      if ( self.health >= self.maxhealth){
        self.maxhealth = self.health;
      }
      if ((self.health / self.maxhealth) * 100 <= 40){
        self juggernaut_low_health();
      } else if ((self.health / self.maxhealth) * 100 <= 60){
        self juggernaut_medium_health();
      } else {
        self.healthmode = "high";
      }
    }else {
      self juggernaut_low_health();
      return;
    }
  }
}
juggernaut_low_health()
{
  iprintlnbold(self.name + "- Juggernaut hurt !" + self.health);
  self.combatmode = "cover";
  self.healthmode = "low";

}
juggernaut_medium_health()
{
  iprintlnbold(self.name + "- Juggernaut medium !" + self.health);
  self.combatmode = "cover";
  self.healthmode = "medium";
}
set_ai(){
  // level.survival_ai
}
// #include maps/_1564
// #include maps/_1571
// #include maps/_1574

// Done
// You have the ability to spawn Juggernauts on your team (AI - ally_so_delta/ally_so_riotshield) // _so_survival_armory.gsc - > configure your Juggernauts

// TODO
// 1-find an ingame trigger based on whenever an enemy juggernaut spawns
// 2-if the level has spawned a juggernaut, check if the player currently has any allies alive
// 3- if the player has no allies alive, do nothing. however if player has allies that are alive run the rest of the script.
// 4- ally juggernauts currently use self.combatmode= "nocover";
// 5- if mid life behaviour changes are possible (i think they are as enemies have aggression behaviour change when a juggernaut spawns< maybe could use the same trigger?)
// 6- script will change ally behaviour to self.combatmode "cover"; if an enemy jugg is alive and println if an enemy jugg has spawned, once there are no juggernauts left change back to "no_cover" and print ln

/**
  evaluate whether the ally AI needs to change
 */
// level_boss_ally_behavior_change( )
// {
//     wait 2;

    
//     if (is_ally_alive == 0) {
//       // Do nothing
//     }
   

//       axis_array = getaiarray( "axis" );
//       bosses = level._id3D64;
//       array_merge = maps\_utility::_id_1843;
//       if ( isdefined( bosses ) && bosses.size )
//         axis_array = array_merge( axis_array, bosses );

//       axis_array = array_merge( axis_array, _id_3DC4() );
//       return axis_array;
      
      
//       if ( isalive (jug_regular, jug_headshot, jug_explosive, jug_MW2) )
//         return 1;
//       iprintlnbold("Enemy Juggernaut Detected Switching Combat Mode To 'Assault'");
//     }
// }