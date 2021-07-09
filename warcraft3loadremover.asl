/**
 * Vincent Vega

 * @game	   Warcraft III Classic
 * @category   Autosplitter, Load Time Removal
 * @version    0.8

	 * @supported  1.29 RU
 */

state("Warcraft III")
{
	uint igt : "Warcraft III.exe", 0xD75A0C;
	uint interlude : "Warcraft III.exe", 0xDB2A48;
	uint morinterlude : "Warcraft III.exe", 0xDB3300;
	uint victory : "Warcraft III.exe", 0xD3939C;
	uint start : "Warcraft III.exe", 0xD759D4;
	uint end : "Warcraft III.exe", 0xD5EC1C;
	uint ingame : "Warcraft III.exe", 0xD38AA4;
	uint hover: "Warcraft III.exe", 0xD48634;
	uint strtchk: "Warcraft III.exe", 0xD397F8;
	uint menuchk: "Warcraft III.exe", 0xD5EB9C;
}	

startup 
{
	refreshRate = 100;
	/** Can be lower to reduce CPU usage */
}

init
{
	vars.previousIGT = 0;
	vars.currentIGT = 0;
}

update	
{
	vars.previousIGT = vars.currentIGT;
	vars.currentIGT = current.igt;
}

isLoading
{
	return vars.currentIGT <= vars.previousIGT || current.interlude == 1 || current.morinterlude != 0;
	/** Includes interlude check to prevent false counting */
}

split
{	
	return (
		current.victory == 2 && old.victory != 2 || /** Victory screen */
		current.start == 11 && old.start != 11 && current.ingame == 0 && current.hover == 1 && current.igt == 0	&& current.strtchk == 0 && current.menuchk != 109 || /** Prologue */
		current.start == 12 && old.start != 12 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Prologue */
		current.start == 33 && old.start != 33 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Human */
		current.start == 34 && old.start != 34 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Human */
		current.start == 7 && old.start != 7 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Undead */
		current.start == 19 && old.start != 19 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Undead */
		current.start == 28 && old.start != 28 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Orc */
		current.start == 29 && old.start != 29 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109	 || /** Orc */
		current.start == 8 && old.start != 8 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109  || /** Night Elf & Undead */
		current.start == 9 && old.start != 9 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 /** Night Elf & Undead */
		/** Includes ingame check to prevent false start. */
	);
}

start 
{
	return (	
		current.start == 11 && old.start != 11 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Prologue */
		current.start == 12 && old.start != 12 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Prologue */
		current.start == 33 && old.start != 33 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Human */
		current.start == 34 && old.start != 34 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Human */
		current.start == 7 && old.start != 7 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Undead */
		current.start == 19 && old.start != 19 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Undead */
		current.start == 28 && old.start != 28 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Orc */
		current.start == 29 && old.start != 29 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Orc */
		current.start == 8 && old.start != 8 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 || /** Night Elf & Undead */
		current.start == 9 && old.start != 9 && current.ingame == 0 && current.hover == 1 && current.igt == 0 && current.strtchk == 0 && current.menuchk != 109 /** Night Elf & Undead */
		/** Includes ingame check to prevent false start. */
	);
}