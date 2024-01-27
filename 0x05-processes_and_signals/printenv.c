#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

extern char **environ;

int main(int argc, char *argv[])
{
	int c = 0;
	while (environ[c] != NULL)
	{
		printf("%s\n",environ[c]);
		c++;
	}
	return(0);
}

