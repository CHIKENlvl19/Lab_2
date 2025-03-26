#include <iostream>

using namespace std;

bool string_check(string S, string T){
    
    if(S.length() != T.length()){
        return false;
    }

    string concatenationString = S + S;

    return concatenationString.find(T) != -1;
}

int main()
{
    cout << "Enter two strings separated by space: ";
    string S, T;
    cin >> S >> T;
    
    cout << (string_check(S, T) ? "Yes" : "No");

    return 0;
}
