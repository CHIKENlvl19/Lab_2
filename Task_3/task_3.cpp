#include <iostream>
#include <vector>
#include <algorithm> // заголовочный файл для reverse

using namespace std;

bool isNumberIncreasing(int number){ // функция для проверки числа на возрастание цифр
    if(number / 10 < 1){
        return false;
    } 
    vector<int> digits;

    while(number > 0){
        digits.push_back(number % 10);
        number /= 10;
    }

    reverse(digits.begin(), digits.end()); // переворачиваем вектор по итераторам

    for(size_t i = 1; i < digits.size(); i++){
        if(digits[i] <= digits[ i - 1]){
            return false;
        }
    }

    return true;
}

int reverseNumber(int number){ // функция для переворачивания числа
    vector<int> digits;

    while(number > 0){
        digits.push_back(number % 10);
        number /= 10;
    }

    int Number = 0;
    for(int digit : digits){
        Number = Number * 10 + digit;
    }

    return Number;
}

int main(){

    cout << "Введите числа, которые хотите проверить через пробел (CTRL + D для окончания): ";
    vector<int> numbers;

    int number; 
    while(cin >> number){ // ввод чисел, пока не будет введен EOF (CTRL + D)       
        if (number == 0) break;
        numbers.push_back(number);
    }

    cout << endl;
    short countSuccess = 0;
    for(int n : numbers){ // проверка чисел и вывод
        if(isNumberIncreasing(n)){
            cout << reverseNumber(n) << " ";
            countSuccess++;
        }
    }

    if(countSuccess == 0){
        cout << "Искомых чисел не найдено!" << endl;
    }

    return 0;
}