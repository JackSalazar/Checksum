.text
.globl checksum
checksum: nop                                           #public static int checksum(){  
#bookkeeping
#t0 : i                                           #int i;
#t1 : max_int                                         #int max_int    = 255;
#t2 : quotient                                         #int quotient;
#t3 : remainder                                          #int remainder; 
#t4 : sum                                          #int sum = 0;
#t5 : checksum                                          #int checksum;
#t6 : header_checksum                                          #int header_checksum = 0;
#t7 : value                                          #int value;
#t8 : qsetup                                         #int qsetup;
#v0 : result                                         #int result;

init:   nop                                                    #;
        li $t0, 0                                                  #i = 0;
loop:   bge $t0, 10, done                                                   #or (;i < 10;){
body:   nop                                                   #;
        li $v0, 5                                                  #    mips.read_d();
        syscall
        jr $ra

                                                           #    value = mips.retval();
                
    decision:                                              #             if (i == 5){
    ifbody:                                                #       ;
                                                           #        header_checksum = value;
                                                           #    } else {
    ifnot:                                                 #    ;          
                                                           #        sum = sum + value; 
                                                           #    }
next:                                                      #    ;               
                                                           #    i = i + 1;
                                                           #    continue loop;
                                                           #}
done:   nop                                                      #;  
        li $v0, 999
        jr $ra
                                                           #qsetup = max_int +1;
                                                           #quotient = sum / qsetup;

                                                           #remainder = sum % qsetup;

                                                           #qsetup = quotient + remainder;
                                                           #checksum = max_int - qsetup;

                                                           #if (header_checksum == checksum) {
    otherifbody:                                           #    result = 0;         
                                                           #}else {
    otherifnot:                                            #     result = checksum;          
                                                           #}

                                                           #return result; 
                                           #}