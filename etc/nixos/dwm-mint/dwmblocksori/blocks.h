//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	//{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"  ", "free -h | awk '/^Mem/ { print $3 }' | sed s/i//g",	10,		0},
	{"", "date '+%I:%M %p'",					5,		0},
	{"",    "/home/mint/.local/bin/battery.sh",      60,               0 },
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "   ";
static unsigned int delimLen = 5;
