# Checksum
### Validating an IPv4 header via the checksum values

```
check·sum | ˈCHekˌsəm |
noun
a digit representing the sum of the correct digits in a piece of stored or transmitted 
digital data, against which later comparisons can be made to detect errors in the data.
```

# Overview:
In this assignment, you are to develop a program that computes the simple checksum of 8-bit integers.  This program is *based* upon the calculation of the checksum value of a IPv4 header, defined by RFC791. 

This subroutine has been modified from the formal definition of the IPv4 checksum calculation to work with an 8-bit checksum as opposed to a 16-bit checksum.  

The subroutine performs the follow set of calculations:

   ```java
   max_int    = 255;

   sum               = (summation i=0,4  value_i ) + (summation i=6,9  value_i )
   header_checksum   = value_5;

   quotient   = sum / (max_int + 1);
   remainder  = sum % (max_int + 1);

   checksum = max_int - ( quotient + remainder );

   result   = (header_checksum == checksum) ? 0 : checksum;
   ```

Note that "input_{n}" denotes the n<sup>th</sup> call to the OS to read an integer from stdin.  This call to the OS can be performed via the following Java code:

   ```java
   mips.read_d();
   value_{i} = mips.retval();
   ```

## Objectives
   1. To obtain a better understanding how the Network Layer (layer 3) uses the checksum field to determine if an transmission error occurs.

   1. To exercise our knowledge of control flow. The program requires the use of
      - two for-loops, and
      - a ternary operator, which is equivalent to an if-then-else statement.

   1. To expand our usage of the sth system, and further our understand of the CLI.

## Specifications and Limitations
   1. You must use the development process defined by the Professor. See [Programming Workflow](./programming_workflow.md) for more details.

   1. Your java_tac code may use operations with immediate values.
      - but such immediate values can only be the second operand
      - for example,  `var = var {op} imm;` is permissible.
      - for example,  `var = imm {op} var;` is *not* permissible.

   1. You many only use native MIPS instructions


## Tasks
Note that these instructions presume that the current working directory is: `~/classes/comp122/deliverables/41-simple-interest-{account}`.

### Test_cases:
  1. Create at least one test cases within the file `test_cases/{account}.sth_case`. 
     * See the file `test_cases/{smf-steve}.sth_case` as an example.

  1. Trade your test cases with at least two other students. Place these files into your `test_cases` directory.  E.g., 
     - `test_cases/{student_1}.sth_case`
     - `test_cases/{student_2}.sth_case`

  1. Add and commit these test cases to your local repository:
     ```bash
     git add test_cases/{account}.sth_case
     git add test_cases/{student_1}.sth_case
     git add test_cases/{student_2}.sth_case
     git commit -m 'adding shared test_cases'
     ```

#### Additional Testing Information:

This assignment requires your method to make a number of calls to the OS to obtain 10 integers. These calls will require a beginner programmer to enter each of these values one by one, followed by the EOT character (^d).  You can then test your program via the following input:

  ```bash
  $ java_subroutine java/checksum
  145
  24
  16
  54
  1
  81
  225
  174
  12
  33
  ^d
  $ echo $?
  0
  $
  ```
If the entered values are correct, the exit status (the '$?' value) will be zero. Otherwise, the exit status is assigned the value of the correct `checksum` value. That is to say, a non-zero exist status is deemed an _error_.

Taking one step to automate our testing, we place these 10 values into a file, `test_cases/81.txt`.  We then run the following commands instead of the ones above.

  ```bash
  $ java_subroutine java/checksum < test_cases/81.txt
  $ echo $?
  0
  $
  ```

We can then take additional steps to automate our testing procedures, via the `sth` system.  We create a file, `test_cases/checksum.sth_case`, that contains the following specification:

  ```sth
  [default]
  DRIVER=java_subroutine

  [global]
  ENTRY=checksum

  [case]
  INPUT=../test_cases/81.txt
  EXIT_STATUS=0
  ```

We can then use the following command to perform the above test case.

  ```bash
  cd java ; sth_validate ../test_cases/checksum.sth_case ; cd ..
  ```

or the following command to perform all the test cases contained within the `../test_cases` directory.

  ```bash
  cd java ; sth_validate ../test_cases/*.sth_case ; cd ..
  ```

Of course, we have a make recipe that takes it even a step further.  We can simply execute one of the follow commands to test each of our tasks, or all three task together. Moreover, it will not perform one test case but a suit of test cases.

  ```bash
  make test_java
  make test_java_tac
  make test_mips
  make test
  ```


### Java: `checksum.j`

  1. Start the `java` Task with the file `java/check_sum.j` (see [Programming Workflow](./programming_flow.md))
  1. Incrementally Work on the `java` Task  
     * Write a Java Method to compute checksum value
       - Insert the following starter code into your java/checksum.j file
         ```java
         public static int checksum() {
   
           // Insert your solution here
 
           return result;
         }
         ```

     * Test your solution via `java_subroutine` or `make test_java`
         * See the above for additional testing information.

     * Commit your changes to the repository: 
         ```bash
         git add java/checksum.j
         git commit -m "{message}" -a
         ```

     * Continue: continue working on your solution until you have a working solution.

  1. Finish your Java Task   


### Java_tac: `checksum.j`  
  1. Start the `java_tac` Task
  1. Incrementally Work on your `java_task` task
  1. Finish the `java_tac` task.


### MIPS: `checksum.s`
  1. Start the `mips` Task with the file `mips/checksum.s`
     - edit `mips/checksum.j` to include the following starter code.

       ```mips
                            .text
                            .globl check_sum
                            .include "include/stack.s"
                            .include "include/syscalls.s"

       check_sum:           nop
       ```
  1. Incrementally Work on your `mips` task
  1. Finish the `mips` task.


### Finish the assignment: 
At this point, you have completed the assignment and you have submitted it. But now you have a chance to "confirm" that when the Professor grades the assignment, it is based upon what you believe you submitted.

In short, perform one more test to make sure everything is as it should be.

  ```bash
  git switch main
  make confirm
  ```

Make any alterations to your previous work to ensure you maximize your score.  Note you must remember to reset and to republish your "submission" tags correctly.  The tags are what the Professor uses to determine *what* to grade.



# Other Information and Resources:
This program is based upon the structure if a IPv4 packet.  Although you do not need to understand this structure to complete this assignment, you may want to review some of the material associated with IPv4.  More information will be provided in the lecture.
  * https://en.wikipedia.org/wiki/IPv4
  * https://en.wikipedia.org/wiki/IPv4_header_checksum


### Notes:
  * The IPv4 header utilizes a checksum field that is 16-bit quantity. This program reduces the size in half to a 8-bit quantity.  Correspondingly, the following changes are made to keep things consistent: 
  
    1. The IPv4 header, without any options, has a total size of 20 bytes. This program reduces the size in half to a 10 byte size.

    1. This checksum value is stored in the 11th & 12th byte of the IPv4 header. This program assigns its location to the 6th byte.


