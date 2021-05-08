# String Encryption

Receive an integer n (n >= 1) and a string consisting of alphabetic capital letters only from the user. The maximum length of a string is 100 characters, including a NULL character at the end. Make a program to encrypt the string with n.

Here is how to encrypt a string. For example, if n is 3 and a string is "BINARY", we add 3 to each character in the string. More specifically, the first character ‘B’ plus 3 becomes ‘E’ and ‘I’ plus 3 becomes ‘L’. In this way, ‘N’, ‘A’, and ‘R’ become ‘Q’, ‘D’, and ‘U’, respectively. In the case of ‘Y’, adding 3 goes beyond ‘Z’. Thus, we consider the character after ‘Z’ to be ‘A’ and ‘Y’ plus 3 becomes ‘B’. Eventually, the string "BINARY" becomes the encrypted string "ELQDUB", when n is 3.

Note that the n can be a large value, which is much larger than 26 (the number of alphabetic

## RUN
```shell
~/Projects/Encoder $ ./bin/Encoder
n : 1
String : ABCXYZ
Encrypted string : BCDYZA
~/Projects/Encoder $ ./bin/Encoder
n : 28
String : ZXCVBNMM
Encrypted string : BZEXDPOO
~/Projects/Encoder $ ./bin/Encoder
n : 34
String : adsfBADFANSDFLMEWR
 --> Input uppercase only, [a] would be ignored
 --> Input uppercase only, [d] would be ignored
 --> Input uppercase only, [s] would be ignored
 --> Input uppercase only, [f] would be ignored
Encrypted string : JILNIVALNTUMEZ
```