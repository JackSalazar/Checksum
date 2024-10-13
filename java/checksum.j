public static int checksum(int args[]){  
   max_int    = 255;

   sum               = (summation i=0,4  value_i ) + (summation i=6,9  value_i )
   header_checksum   = value_5;

   quotient   = sum / (max_int + 1);
   remainder  = sum % (max_int + 1);

   checksum = max_int - ( quotient + remainder );

   result   = (header_checksum == checksum) ? 0 : checksum;
}