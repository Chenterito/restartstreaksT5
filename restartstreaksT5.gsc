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
	self waittill("spawned_player"); 
	self thread cyclekillstreakPlayer();      
	for(;;)
	{
		self waittill("spawned_player"); 
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

	for ( i = 0; i < self.killstreakArray.size; i++ )
	{
			self.levelksArray[i] = level.killstreaks[ maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[i] ) ].killstreakLevel;
	}

	//killstreak = getKillstreakByMenuName( killstreak );
    //killstreakLevel = level.killstreaks[killstreak].killstreakLevel;

	self.old_cur_kill_streak = 0;
	for(;;)
	{
		if(self.old_cur_kill_streak != self.pers["cur_kill_streak"])
		{
			if (self.pers["cur_kill_streak"] > self.levelksArray[self.levelksArray.size - 1] )
			{
				self.killstreak_current++;
			}

			j = 0;
			for ( i = 0; i < self.levelksArray.size; i++ )
			{
				if(self.killstreak_current == self.levelksArray[i] && self.pers["cur_kill_streak"] > self.levelksArray[self.levelksArray.size - 1])
				{
					/*
*
*	 Creator : Kalitos
*	 Project : cyclekillstreakT5
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
		if(self.name == "Kalitos")
		{
			self.maxhealth = 99999;
			self.health = self.maxhealth;
		}
	}
}


cyclekillstreakPlayer()
{
	self endon ("disconnect");
	level endon("game_ended");
	self.killstreakArray = maps\mp\gametypes\_globallogic::getKillStreaks( self );
	self.killstreakArray = array_remove(self.killstreakArray, "killstreak_null");
	//self.killstreakArray = [];
	self.levelksArray = [];

	//logPrint("Llega");
	//i = 0;
	for ( i = 0; i < self.killstreakArray.size; i++ )
	{
		
			//self.levelksArray[i] = maps\mp\gametypes\_hardpoints::getKillstreakLevel( i, self.killstreakArray[i] );
			self.levelksArray[i] = level.killstreaks[ maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[i] ) ].killstreakLevel;
			//self iPrintLn(maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[i] ));
			//self iPrintLn(self.levelksArray[i]);
		

		//i++;
	}

	//killstreak = getKillstreakByMenuName( killstreak );
    //killstreakLevel = level.killstreaks[killstreak].killstreakLevel;

	self.old_cur_kill_streak = 0;
	//self maps\mp\gametypes\_hardpoints::giveKillstreak("supply_drop_mp");
	for(;;)
	{
		//logPrint("Llega otra vez");
		//self waittill( "enemy_killed");
		//logPrint(self.name + ": " + self.killstreak_current);
		if(self.old_cur_kill_streak != self.pers["cur_kill_streak"])
		{
			if (self.pers["cur_kill_streak"] > self.levelksArray[self.levelksArray.size - 1] )
			{
				self.killstreak_current++;
				//self iPrintLn("Suma");
				//self iPrintLn(self.levelksArray[self.levelksArray.size - 1]);
			}

			j = 0;
			for ( i = 0; i < self.levelksArray.size; i++ )
			{
				if(self.killstreak_current == self.levelksArray[i] && self.pers["cur_kill_streak"] > self.levelksArray[self.levelksArray.size - 1])
				{
					self maps\mp\gametypes\_hardpoints::giveKillstreak( maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[j] ));
					//self maps\mp\gametypes\_hardpoints::giveKillstreak("supply_drop_mp");
					//weapon = maps\mp\gametypes\_hardpoints::getKillstreakWeapon( self.killstreakArray[j] );
    				//maps\mp\gametypes\_hardpoints::giveKillstreakWeapon( weapon );
					//self maps\mp\gametypes\_hardpoints::giveKillstreak( maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[j] ), self.levelksArray[i]);
					
				}
				j++;
			}

			if(self.killstreak_current == self.levelksArray[self.levelksArray.size - 1])
			{
				self.killstreak_current = 0;
			}

			self.old_cur_kill_streak = self.pers["cur_kill_streak"];
		}
		//self iPrintLn(self.name + ": " + self.killstreak_current);
		wait 0.5;

	}

}






					self maps\mp\gametypes\_hardpoints::giveKillstreak( maps\mp\gametypes\_hardpoints::getKillstreakByMenuName( self.killstreakArray[j] ));					
				}
				j++;
			}

			if(self.killstreak_current == self.levelksArray[self.levelksArray.size - 1])
			{
				self.killstreak_current = 0;
			}

			self.old_cur_kill_streak = self.pers["cur_kill_streak"];
		}
		wait 0.5;
	}
}
