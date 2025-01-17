#ifndef COMPLEX_H
#define COMPLEX_H
#include<iostream>
#include<fstream>
#include<string>
#include<vector>
#include<iomanip>
#include<cmath>

using namespace std;

class COMPLEX
{

public:
	typedef struct{
		double real;
		double imaginary;		
			}complex;

		
	static  double getReal(complex n, int form );
	static  double getImaginary(complex n, int form);
	static	double getMagnitude(complex n, int form);
	static	double getPhase(complex n, int form);
	static	complex add(complex n, complex m, int form);
	static	complex subtract(complex n, complex m, int form);
	static	complex multiply(complex n, complex m, int form);
	static	complex divide(complex n, complex m, int form);
	static	complex getConjugate(complex n);
	static	complex getPower(int npower, complex n, int form);
	static	complex getRoot(int mroot, complex n, int form);
	static	complex changeToCart(complex n);
	static	complex changeToPolar(complex n);
		
};
#endif
