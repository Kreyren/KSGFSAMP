//****************************************
//*                                      *
//*         Chat Color Name for GF       *
//*              By eXtrike              *
//*             Credits Farse            *
//*		      www.equilibrum.ro          *
//*			   Copyright 2010            *
//*                                      *
//****************************************

//Includes

#include <a_samp>

new BigEar[MAX_PLAYERS];

stock ChatColor(Float:radi, playerid, string[])
{
	if(IsPlayerConnected(playerid)) {
		new Float:posx, Float:posy, Float:posz,Float:oldposx, Float:oldposy, Float:oldposz,Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new i = 0; i < MAX_PLAYERS; i++) {
			if(IsPlayerConnected(i)) {
				if(!BigEar[i]) {
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16))) {
						SendPlayerMessageToPlayer(i,playerid,string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8))) {
						SendPlayerMessageToPlayer(i,playerid,string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4))) {
						SendPlayerMessageToPlayer(i,playerid,string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2))) {
						SendPlayerMessageToPlayer(i,playerid,string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) {
						SendPlayerMessageToPlayer(i,playerid,string);
					}
				}
				else { SendPlayerMessageToPlayer(i,playerid,string); }
			}
		}
	}//not connected
	return 1;
}