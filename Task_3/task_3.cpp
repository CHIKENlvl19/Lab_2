#include <iostream>
#include <vector>
#include <algorithm> // для reverse

using namespace std;

bool isNumberIncreasing(int number){
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

int reverseNumber(int number){
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

    cout << "Введите числа, которые хотите проверить через пробел (0 для окончания): ";
    vector<int> numbers;

    int number;
    while(number != 0){        
        cin >> number;
        if (number == 0) break;
        numbers.push_back(number);
    }

    cout << endl;
    for(int n : numbers){
        if(isNumberIncreasing(n)){
            cout << reverseNumber(n) << " ";
        }
    }

    return 0;
}