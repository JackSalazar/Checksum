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
   
                qsetup = max_int +1;
                quotient = sum / qsetup;

                remainder = sum % qsetup;

                qsetup = quotient + remainder;
                checksum = max_int - qsetup;

                if (header_checksum == checksum) {
    otherifbody:    result = 0;         
                }else {
    otherifnot:      result = checksum;          
                }

                return result; 
}