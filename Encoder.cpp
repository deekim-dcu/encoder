//
//  Encoder.cpp
//  Encoder
//
//  Created by Dee Kim on 2021/05/08.
//

#include "Encoder.hpp"

Encoder::Encoder()
{
    buf = new char[SIZE];
}

Encoder::~Encoder()
{
    delete[] buf;
}

void Encoder::encode(int n = 3)
{
    n %= 26;
    for (int idx = 0; buf[idx] != '\0' && idx < SIZE; idx++)
        buf[idx] = static_cast<char>(buf[idx] + n - (buf[idx] + n > static_cast<int>('Z') ? 26 : 0));
}

istream &operator >> (istream &in, Encoder &encoder)
{
    char c;
    int idx;
    in.ignore(INT_MAX,'\n');
    cout << "String : ";
    for (idx = 0; idx < encoder.SIZE - 1; idx++)
    {
        if (in.peek() == '\n')
            break;

        in >> c;
        if (isupper(c))
            encoder.buf[idx] = c;
        else
        {
            idx--;
            cout << " --> Input uppercase only, [" << c << "] would be ignored" << endl;
        }
    }
    encoder.buf[idx] = '\0';

    return in;
}

ostream &operator << (ostream &out, const Encoder &encoder)
{
    out << "Encrypted string : " << encoder.buf << endl;

    return out;
}
