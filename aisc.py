def NOT(x):
    if x>=0 and x!=1:
        return 1
    else:
        return 0

def OR(x,y):
    w1=w2=bias=1
    if w1*x+w2*y>=bias:
        return 1
    else:
        return 0

def AND(x,y):
    w1=w2=1
    bias=2
    if w1*x+w2*y>=bias:
        return 1
    else:
        return 0

def XOR(a,b):
    return OR(AND(a,NOT(b)),AND(b,NOT(a)))

def Sum(a,b,c_in):
    return XOR(c_in,XOR(a,b))

def carry(a,b,c_in):
    w1=w2=w3=1
    bias=2
    if(w1*a+w2*b+w3*c_in>=bias):
        return 1
    else:
        return 0

def full_adder(x,y,z,a,b,c):
    c_in=0
    output=[0]*4
    output[3] = Sum(z,c,c_in)
    c_in = carry(z,c,c_in)
    output[2] = Sum(y,b,c_in)
    c_in = carry(y,b,c_in)
    output[1] = Sum(x,a,c_in)
    output[0] = carry(x,a,c_in)
    return output
    

valid1 = valid2 = False
x=y=z=a=b=c=0
while(valid1 == False and valid2 == False):
    x,y,z=[int(i) for i in input('Enter the first number with space separated digits ').split()]
    if(x not in [0,1] or y not in [0,1] or z not in [0,1]):
        print('please re-enter valid values')
    else:
        valid1=True

    a,b,c=[int(i) for i in input('Enter the second number with space separated digits  ').split()]
    if(x not in [0,1] or y not in [0,1] or z not in [0,1]):
        print('please re-enter valid values')
    else:
        valid2=True

f=full_adder(x,y,z,a,b,c)
for i in f :
    print(i,end='')
