//
//  main.cpp
//  Encoder
//
//  Created by Dee Kim on 2021/05/08.
//

#include "Encoder.hpp"

int main(int argc, const char * argv[]) {
    int n;
    cout << "n : ";
    cin >> n;
    
    Encoder encoder;
    cin >> encoder;
    encoder.encode(n);
    cout << encoder;
    
    return 0;
}
