public static int checksum(){  
   int max_int    = 255;
   int quotient; // = 0;
   int remainder; // = 0;
   int sum = 0;
   int checksum = 0;
   int header_checksum= 0;
   int result = 0;
   int value = 0;

   //mips.read_d();
   //value = mips.retval();
   //return value;
   //result = 0;
   //sum               = (summation i=0,4  value_i ) + (summation i=6,9  value_i ); // PSDUEOCODE Take the first 5 values and add them, take the 6th value, in the 5 slot, and use that as the header for hte checksum. Add the remaining 4 values to the original count
   //header_checksum   = value_5;
   
   for (int i = 0; i < 10; i++){
    mips.read_d();
    value = mips.retval();

    //System.out.println(value);
    //System.out.println(i);
    if (i == 5){
        header_checksum = value;
    } else {
        sum += value;
    }
   }
   
   quotient   = sum / (max_int + 1); //quotient = 684 / (255 +1) == 2
   //return quotient;
   
   remainder  = sum % (max_int + 1); //remainder = 684 % (255 + 1) == 172
   //return remainder;
    
   checksum = max_int - ( quotient + remainder ); //the checksum is the value to verify that there was no corruption

   result   = (header_checksum == checksum) ? 0 : checksum; //if the header and checksum are the same, then return 0, which means everything is okay. Otherwise, return what the checksum should be
   
   return result; 
   
   //return 999;
}