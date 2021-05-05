/**
 * Warcraft III Loading Times Removal

 * @game	   Warcraft III Classic
 * @category   Load Time Removal
 * @author     1826 <speedrun.com/user/1826>
 * @version    1.0

	 * @supported  1.29 RU
				   
	 * @todo	   Add support for EN version, 1.26 RU version	   
 */

/**
 * Warcraft III 1.29 RU
 */
 
state("Warcraft III")
{
	byte load: 0xD74CE0;	
}

isLoading
{
	return current.load == 0;
}
