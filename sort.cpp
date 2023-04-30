#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

void insertionSort(int arr[], int n) {
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

int main() {
    srand(time(NULL));
    for (int i = 0; i < 1000000; i++) {
        int arr[100];
        for (int j = 0; j < 100; j++) {
            arr[j] = rand() % 100 + 1;
        }
        int n = sizeof(arr) / sizeof(arr[0]);
        for (int j = 0; j < 100; j++) {
            insertionSort(arr, n);
        }
    }
    cout << "Done" << endl;
    return 0;
}
