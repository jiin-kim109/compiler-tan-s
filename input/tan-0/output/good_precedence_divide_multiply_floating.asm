        Jump         $$main                    
        DLabel       $eat-location-zero        
        DataZ        8                         
        DLabel       $print-format-integer     
        DataC        37                        %% "%d"
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-floating    
        DataC        37                        %% "%f"
        DataC        102                       
        DataC        0                         
        DLabel       $print-format-boolean     
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-character   
        DataC        37                        %% "%c"
        DataC        99                        
        DataC        0                         
        DLabel       $print-format-string      
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-newline     
        DataC        10                        %% "\n"
        DataC        0                         
        DLabel       $print-format-space       
        DataC        32                        %% " "
        DataC        0                         
        DLabel       $print-format-tab         
        DataC        9                         %% "\t"
        DataC        0                         
        DLabel       $boolean-true-string      
        DataC        116                       %% "true"
        DataC        114                       
        DataC        117                       
        DataC        101                       
        DataC        0                         
        DLabel       $boolean-false-string     
        DataC        102                       %% "false"
        DataC        97                        
        DataC        108                       
        DataC        115                       
        DataC        101                       
        DataC        0                         
        DLabel       $errors-general-message   
        DataC        82                        %% "Runtime error: %s\n"
        DataC        117                       
        DataC        110                       
        DataC        116                       
        DataC        105                       
        DataC        109                       
        DataC        101                       
        DataC        32                        
        DataC        101                       
        DataC        114                       
        DataC        114                       
        DataC        111                       
        DataC        114                       
        DataC        58                        
        DataC        32                        
        DataC        37                        
        DataC        115                       
        DataC        10                        
        DataC        0                         
        Label        $$general-runtime-error   
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        DLabel       $errors-int-divide-by-zero 
        DataC        105                       %% "integer divide by zero"
        DataC        110                       
        DataC        116                       
        DataC        101                       
        DataC        103                       
        DataC        101                       
        DataC        114                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        Label        $$i-divide-by-zero        
        PushD        $errors-int-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-float-divide-by-zero 
        DataC        102                       %% "float divide by zero"
        DataC        108                       
        DataC        111                       
        DataC        97                        
        DataC        116                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        Label        $$f-divide-by-zero        
        PushD        $errors-float-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-bad-comparison-operand 
        DataC        98                        %% "bad comparison operand"
        DataC        97                        
        DataC        100                       
        DataC        32                        
        DataC        99                        
        DataC        111                       
        DataC        109                       
        DataC        112                       
        DataC        97                        
        DataC        114                       
        DataC        105                       
        DataC        115                       
        DataC        111                       
        DataC        110                       
        DataC        32                        
        DataC        111                       
        DataC        112                       
        DataC        101                       
        DataC        114                       
        DataC        97                        
        DataC        110                       
        DataC        100                       
        DataC        0                         
        Label        $$bad-comparison-operand  
        PushD        $errors-bad-comparison-operand 
        Jump         $$general-runtime-error   
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        0                         
        Label        $$main                    
        Label        -Operator-1-args          
        PushF        2.000000                  
        Nop                                    
        PushF        5.300000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        3.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-2-args          
        PushF        8.600000                  
        Nop                                    
        PushF        5.600000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        2.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-3-args          
        PushF        8.200000                  
        Nop                                    
        PushF        7.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        6.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-4-args          
        PushF        7.200000                  
        Nop                                    
        PushF        8.100000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        4.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-5-args          
        PushF        8.500000                  
        Nop                                    
        PushF        2.400000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        5.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-6-args          
        PushF        8.100000                  
        Nop                                    
        PushF        9.300000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-7-args          
        PushF        8.400000                  
        Nop                                    
        PushF        7.600000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        9.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-8-args          
        PushF        5.400000                  
        Nop                                    
        PushF        6.900000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        6.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-9-args          
        PushF        5.400000                  
        Nop                                    
        PushF        9.400000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        1.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-10-args         
        PushF        2.600000                  
        Nop                                    
        PushF        5.100000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-11-args         
        PushF        7.400000                  
        Nop                                    
        PushF        7.600000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        9.900000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-12-args         
        PushF        2.500000                  
        Nop                                    
        PushF        7.200000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        1.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-13-args         
        PushF        8.600000                  
        Nop                                    
        PushF        6.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.200000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-14-args         
        PushF        8.800000                  
        Nop                                    
        PushF        7.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.200000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-15-args         
        PushF        9.700000                  
        Nop                                    
        PushF        6.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-16-args         
        PushF        7.900000                  
        Nop                                    
        PushF        6.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.400000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-17-args         
        PushF        5.600000                  
        Nop                                    
        PushF        5.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-18-args         
        PushF        9.300000                  
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-19-args         
        PushF        8.700000                  
        Nop                                    
        PushF        4.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.200000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-20-args         
        PushF        6.900000                  
        Nop                                    
        PushF        8.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-21-args         
        PushF        4.900000                  
        Nop                                    
        PushF        7.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-22-args         
        PushF        6.700000                  
        Nop                                    
        PushF        3.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.800000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-23-args         
        PushF        8.600000                  
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.300000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-24-args         
        PushF        4.300000                  
        Nop                                    
        PushF        9.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.100000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-25-args         
        PushF        2.300000                  
        Nop                                    
        PushF        7.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        9.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-26-args         
        PushF        7.500000                  
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        6.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-27-args         
        PushF        5.900000                  
        Nop                                    
        PushF        1.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        7.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-28-args         
        PushF        6.500000                  
        Nop                                    
        PushF        7.700000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.300000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-29-args         
        PushF        9.900000                  
        Nop                                    
        PushF        6.200000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        8.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.700000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-30-args         
        PushF        9.600000                  
        Nop                                    
        PushF        3.900000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        1.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.900000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-31-args         
        PushF        1.600000                  
        Nop                                    
        PushF        3.300000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        3.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-32-args         
        PushF        2.100000                  
        Nop                                    
        PushF        8.600000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        7.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.200000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-33-args         
        PushF        7.400000                  
        Nop                                    
        PushF        8.700000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        2.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.600000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-34-args         
        PushF        7.500000                  
        Nop                                    
        PushF        1.300000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        3.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.300000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-35-args         
        PushF        9.300000                  
        Nop                                    
        PushF        4.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        8.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-36-args         
        PushF        3.600000                  
        Nop                                    
        PushF        5.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        1.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.700000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-38-args         
        Label        -Operator-37-args         
        PushF        7.400000                  
        Nop                                    
        PushF        7.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.100000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        3.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-40-args         
        Label        -Operator-39-args         
        PushF        8.300000                  
        Nop                                    
        PushF        8.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        2.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-42-args         
        Label        -Operator-41-args         
        PushF        2.100000                  
        Nop                                    
        PushF        8.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.700000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        9.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-44-args         
        Label        -Operator-43-args         
        PushF        8.600000                  
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.400000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        3.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-46-args         
        Label        -Operator-45-args         
        PushF        2.500000                  
        Nop                                    
        PushF        6.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.700000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        9.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-48-args         
        Label        -Operator-47-args         
        PushF        2.900000                  
        Nop                                    
        PushF        1.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.600000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        9.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-50-args         
        Label        -Operator-49-args         
        PushF        4.500000                  
        Nop                                    
        PushF        6.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        4.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-52-args         
        Label        -Operator-51-args         
        PushF        2.600000                  
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.600000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        7.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-54-args         
        Label        -Operator-53-args         
        PushF        5.400000                  
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.400000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        2.900000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-56-args         
        Label        -Operator-55-args         
        PushF        9.800000                  
        Nop                                    
        PushF        9.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.500000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        9.300000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-58-args         
        Label        -Operator-57-args         
        PushF        3.200000                  
        Nop                                    
        PushF        6.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        1.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-60-args         
        Label        -Operator-59-args         
        PushF        1.500000                  
        Nop                                    
        PushF        8.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.400000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Nop                                    
        PushF        6.400000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
