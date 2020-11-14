# Commands
`echo $SHELL` => To know about default shell

`which bash` 	=> Get full path to its executable binary

`chmod +x FILENAME` => Make file executable

`file FILENAME` => get file type


# Scripts

* Variable declaration
```
variable1="variable1"
variable2=$(whoami)
```
## echo

```
echo "Hello $var2"
$echo $a
```

## read

```
read variable
read -p "Name: " variable
```

## arithmetic

```
a=20
b=10
echo $(( a + b ))
echo $(( a - b ))
echo $(( a * b ))
echo $(( a / b ))
echo $(( a % b ))
```

Or

```
echo $( expr $a + $b)
echo $( expr $a - $b)
echo $( expr $a \* $b)
echo $( expr $a / $b)
echo $( expr $a % $b)
```

For Float number

```
a=20.5
b=3.25
echo “$a + $b” | bc
echo “$a - $b” | bc
echo “$a * $b” | bc
echo “scale=2; $a / $b” | bc
echo “$a % $b” | bc
```

## array

```
echo "${a[@]}" // Display all the array value
echo "${!a[@]}" // Display all the array index
echo "${#a[@]}" // Display total number of element.
```

## bc
*Basic Calculator*
```
echo '8.5/2.2' | bc
echo 'scale=5;8.5/2.2' | bc
val=$(scale=5;sqrt(50)' | bc)
```

## Logical Operator

* `-a` (read as AND)
* `-o` (read as OR)
* `!` (read as NOT)


## Bash Shell Numeric and String Comparisons
*Description	Numeric Comparison	String Comparison*
```
less than					-lt		<
greater than	    		-get	>
equal						-eq		=
not equal					-ne		!=
less or equal				-le		N/A
greater or equal			-ge		N/A
null or 0 length			-Z
```

## if-else

```
if [ $a -lt $b ]
then
	echo "A is big"
else
	echo "B is big"
fi
```

## case

```
case $val in
first_case)
	//Do something
;;
second_case)
	//again do something
;;
* )
	//final
;;
esac
```

## function

```
function hello{
	echo "Hello"
}
```

# Loop

## for loop

```
for((i=0;i<=3;i++))
do
	//work
done
```

## While loop

```
counter=0
while [ $counter -lt 3 ]
do
  let counter+=1
  echo $counter
done
```

## until loop

```
counter=0
until [ $counter -lt 3 ]
do
  let counter+=1
  echo $counter
done
```