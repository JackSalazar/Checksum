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
   int qsetup;

init:           ;
                i = 0;
loop:           for (;i < 10;){
body:           ;
                    mips.read_d();
                    value = mips.retval();
                
    decision:                if (i == 5){
    ifbody:         ;
                        header_checksum = value;
                    } else {
    ifnot:          ;          
                        sum = sum + value; 
                    }
next:               ;               
                    i = i + 1;
                    continue loop;
                }
done:           ;  

                //quotient   = sum / (max_int + 1); //quotient = 684 / (255 +1) == 2
                qsetup = max_int +1;
                quotient = sum / qsetup;

                //remainder  = sum % (max_int + 1); //remainder = 684 % (255 + 1) == 172
                remainder = sum % qsetup;


                //checksum = max_int - ( quotient + remainder ); //the checksum is the value to verify that there was no corruption
                qsetup = quotient + remainder;
                checksum = max_int - qsetup;

                result   = (header_checksum == checksum) ? 0 : checksum; //if the header and checksum are the same, then return 0, which means everything is okay. Otherwise, return what the checksum should be
   
                return result; 
}