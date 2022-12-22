#include <stdio.h>
#include <stdint.h>

#define SIZE 32768
#define FILEP "1.file"

uint32_t elf[SIZE] = { 0 };
uint32_t current, sum, best[3] = { 0 };

void
top3()
{
	if (elf[best[0]] <= elf[current])
	{
		best[2] = best[1];
		best[1] = best[0];
		best[0] = current;
	}
	else if (elf[best[1]] <= elf[current])
	{
		best[2] = best[1];
		best[1] = current;
	}
	else 
		best[2] = (elf[best[2]] <= elf[current])? current : best[2];

	/* best = (elf[best] < elf[current])? current : best; */
	current++;
}

int
main(void)
{
	current = sum = 0;
	int c, last;
	
	FILE* fd = fopen(FILEP, "r");

	while(1)
	{
		c = fgetc(fd);
		if(c>= '0' && c <='9')
			sum = sum * 10 + (c-'0');
		else
		{
			if (last == '\n')
				top3();
			else
				elf[current] += sum;
			if (c == EOF)
			{
				top3();
				break;
			}
			sum = 0;
		}
		last = c;
	}
	
	fclose(fd);

	printf("%d\n", elf[best[0]] + elf[best[1]] + elf[best[2]] );
	return 0;
}
