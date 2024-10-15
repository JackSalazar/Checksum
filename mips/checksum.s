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
        li $t0, 0                                             #i = 0;
        li $t1, 255  
        li $t4, 0 
        li $t6, 0        
loop:   bge $t0, 10, done                                                   #or (;i < 10;){
body:   nop                                                   #;
        li $v0, 5                                                  #    mips.read_d();
        syscall
        add $t7, $v0, $zero                                                   #    value = mips.retval();

                
decision:   bne $t0, 5, ifnot                                            #             if (i == 5){
ifbody:     nop                                         #       ;
                add $t6, $t7, $zero                                            #        header_checksum = value;
                b next                                           #    } else {
ifnot:      nop                                           #    ;          
                add $t4, $t4, $t7                                           #        sum = sum + value; 
                                                           #    }
next:   nop                                                   #    ;               
        addi $t0, $t0, 1                                                   #    i = i + 1;
        b loop                                                   #    continue loop;
                                                           #}
done:   nop                                                      #;  
        
        addi $t8, $t1, 1               #qsetup = max_int +1; should be 256
        #add $v0, $t8, $zero
        #jr $ra
        div $t4, $t8                                                   #quotient = sum / qsetup; one should result in 2
        mflo $t2
        #add $v0, $t2, $zero
        #jr $ra
        mfhi $t3                                                   #remainder = sum % qsetup; one should result in 172

        add $t8, $t2, $t3                                                   #qsetup = quotient + remainder;
        sub $t5, $t1, $t8                                                   #checksum = max_int - qsetup;

        bne $t6, $t5, otherifnot                                                   #if (header_checksum == checksum) {
otherifbody: nop
                li $v0, 0
                jr $ra                                           #    result = 0;         
                                                           #}else {
otherifnot: nop 
                add $v0, $t5, $zero                               #     result = checksum;          
                jr $ra                                           #}

                                                           #return result; 
                                           #}