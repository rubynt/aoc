#include <stdio.h>
#include <stdlib.h>

#define MAX_ELVES 150

typedef struct {
  int totalCalories;
  int elfNumber;
} Elf;

void swap(Elf *a, Elf *b) {
  Elf temp = *a;
  *a = *b;
  *b = temp;
}

void heapify(Elf *heap, int size, int i) {
  while (i < size) {
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    int largest = i;

    if (left < size && heap[left].totalCalories > heap[largest].totalCalories) {
      largest = left;
    }

    if (right < size && heap[right].totalCalories > heap[largest].totalCalories) {
      largest = right;
    }

    if (largest == i) {
      break;
    }

    swap(&heap[i], &heap[largest]);
    i = largest;
  }
}

int main() {
  Elf heap[MAX_ELVES];
  int size = 0;

  // Open the input file.
  FILE *file = fopen("1.file", "r");

  // Read the input values from the file.
  int calories;
  while (fscanf(file, "%d", &calories) == 1) {
    if (calories == 0) {
      size++;
    } else {
      heap[size].totalCalories += calories;
    }
  }

  // Close the input file.
  fclose(file);

  // Build the heap.
  for (int i = 0; i < size; i++) {
    heap[i].elfNumber = i;
  }
  for (int i = size / 2; i >= 0; i--) {
    heapify(heap, size, i);
  }

  // Find the Elf carrying the most Calories.
  int maxCalories = 0;
  int maxElfNumber = 0;
  for (int i = 0; i < size; i++) {
    if (heap[i].totalCalories > maxCalories) {
      maxCalories = heap[i].totalCalories;
      maxElfNumber = heap[i].elfNumber;
    }
  }

  // Print the result.
  printf("Elf %d is carrying the most Calories, with a total of %d.\n", maxElfNumber, maxCalories);

  return 0;
}
