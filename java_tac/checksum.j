public static int checksum(){  
   int max_int    = 255;
   int quotient;
   int remainder; 
   int sum = 0;
   int checksum;
   int header_checksum = 0;
   int result;
   int value;
   int i;
init: ;
    i = 0;
   for (;i < 10;){

    mips.read_d();
    value = mips.retval();

    if (i == 5){
        header_checksum = value;
    } else {
        sum += value;
    }

    i = i + 1;
   }
   
   quotient   = sum / (max_int + 1); //quotient = 684 / (255 +1) == 2

   remainder  = sum % (max_int + 1); //remainder = 684 % (255 + 1) == 172

   checksum = max_int - ( quotient + remainder ); //the checksum is the value to verify that there was no corruption

   result   = (header_checksum == checksum) ? 0 : checksum; //if the header and checksum are the same, then return 0, which means everything is okay. Otherwise, return what the checksum should be
   
   return result; 
}