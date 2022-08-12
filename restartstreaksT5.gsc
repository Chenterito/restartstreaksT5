/*
*
*	 Creator : Kalitos
*	 Project : restartkillstreaksT5
*    Mode : Multiplayer
*	 Date : 2022/08/10 - 11:22:19	
*
*/	

#include maps\mp\_utility;
#include common_scripts\utility;

init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player); 		
		player thread onPlayerSpawned();
    }
}	

onPlayerSpawned()
{
	self waittill("spawned_player"); //"changed_class" 
	self thread cyclekillstreakPlayer();      
	for(;;)
	{
		self waittill("spawned_player"); //"changed_class" 
		self.killstreak_current = 0;
		self.old_cur_kill_streak = 0;
	}
}

cyclekillstreakPlayer()
{
	self endon ("disconnect");
	level endon("game_ended");
	self.killstreakArray = maps\mp\gametypes\_globallogic::getKillStreaks( self );
	self.killstreakArray = array_remove(self.killstreakArray, "killstreak_null");
	self.levelksArray = [];
	self.killstreak_current = 0;
	self.old_cur_kill_streak = 0;
	self.indextohighlevelstreak = 0;
	k = 0;
	for ( i = 0; i < self.killstreakArray.size; i++ )
	{
			self.levelksArray[i] = level.killstreaks[ maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[i] ) ].killstreakLevel;
			if(self.levelksArray[i] > k)
			{
				k = self.levelksArray[i];
				self.indextohighlevelstreak = i;
			}
	}
	//killstreak = getKillstreakByMenuName( killstreak );
    //killstreakLevel = level.killstreaks[killstreak].killstreakLevel;

	for(;;)
	{
		if(self.old_cur_kill_streak != self.pers["cur_kill_streak"])
		{
			if (self.pers["cur_kill_streak"] > self.levelksArray[self.indextohighlevelstreak] )
			{
				self.killstreak_current++;
			}

			j = 0;
			for ( i = 0; i < self.levelksArray.size; i++ )
			{
				if(self.killstreak_current == self.levelksArray[i] && self.pers["cur_kill_streak"] > self.levelksArray[self.levelksArray.size - 1])
				{
					self maps\mp\gametypes\_hardpoints::giveKillstreak( maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[j] ));					
				}
				j++;
			}

			if(self.killstreak_current == self.levelksArray[self.indextohighlevelstreak])
			{
				self.killstreak_current = 0;
			}

			self.old_cur_kill_streak = self.pers["cur_kill_streak"];
		}
		wait 0.5;
	}
}
