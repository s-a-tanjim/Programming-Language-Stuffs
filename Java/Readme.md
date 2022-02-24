## Hello World
```sh
public class Hello{
  public static void main(String[] args){
    System.out.println("Hello World!");
  }
}
```

## Variables
```sh
int IntValue=10;
byte ByteVal=127;
short ShortVal = 32767;
long LongVal = 1; // 64bit
float F = 2.5; // 7 digit precision | 4 bytes
double D = 2.55; // 18 digit precision | 8 bytes
char c = 'c';
boolean b = false;
String S = "String";
```

## Data Types
```sh
ArrayList i = new ArrayList();
ArrayList<Integer> j = new ArrayList<Integer>();
i.add(1);
for(Object x:i)
  System.out.println(x);



```

## Operarors
```sh

boolean isVal = Val ? true : false;
```


## Function Overloading
```sh
public class Hello{
  public static void main(String[] args){
    int a = sumVal(1,2);
    int b = sumVal(6);
  }

  public static int sumVal(int a,int b){
    return a+b;
  }

  public static int sumVal(int a){
    return a;
  }
}
//Note
// Just changing return type won't work
```


