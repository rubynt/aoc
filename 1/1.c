#include <stdio.h>
#include <stdint.h>

#define SIZE 32768


int
main(void)
{
	uint32_t list[SIZE] = { 0 };
	uint16_t current, best, sum;
	current = best = sum = 0;
	int c, last;
	
	FILE* fd = fopen("1.file", "r");
	
	while((c = fgetc(fd)) != EOF)
	{
		if(c>= '0' && c <='9')
			sum = sum * 10 + (c-'0');
		else
		{
			if (last == '\n')
			{
				best = (list[best] < list[current])? current : best;
				current++;
			}
			else
				list[current] += sum;
			sum = 0;
		}

		last = c;
	}
	
	fclose(fd);

	printf("%d\n", list[best]);
	return 0;
}
