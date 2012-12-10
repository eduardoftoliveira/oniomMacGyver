#include<stdio.h>
#include<string.h>

int main (int argc, char *argv[])
{
	FILE *f;
	char buffer[100];
	char *pattern = " I=   ";
	char *replace = "\n I=  ";
	int where;
	
	if (argc != 2) {
		printf("Please provide the name of the log file\n");
		return 0;
	}
	
	if ((f = fopen(argv[1], "r+")) == NULL) {
		printf("File not found\n");
		return 0;
	}
	
	while(fgets(buffer, sizeof(buffer), f)) {
		if (strstr(buffer, pattern)) {
			fseek(f, -strlen(buffer), SEEK_CUR);
			fputs(replace, f);
			printf("Line added\n");
			fclose(f);
			return 0;
		}
		
	}
    fclose(f);
    printf("Pattern not found\n");
    return 0;
}
