//
//  Encoder.hpp
//  Encoder
//
//  Created by Dee Kim on 2021/05/08.
//

#ifndef Encoder_hpp
#define Encoder_hpp

#include <iostream>

using namespace std;

class Encoder
{
private:
    static const int SIZE = 100;
    char *buf;

public:
    Encoder();
    ~Encoder();

    void encode(int n);

    friend istream &operator >> (istream &in, Encoder &encoder);
    friend ostream &operator << (ostream &out, const Encoder &encoder);
};

#endif /* Encoder_hpp */
