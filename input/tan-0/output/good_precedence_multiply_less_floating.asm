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
        PushF        7.500000                  
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-2-true           
        Jump         -compare-2-false          
        Label        -compare-2-true           
        PushI        1                         
        Jump         -compare-2-join           
        Label        -compare-2-false          
        PushI        0                         
        Jump         -compare-2-join           
        Label        -compare-2-join           
        JumpTrue     -print-boolean-3-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-3-join     
        Label        -print-boolean-3-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-3-join     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-4-args          
        PushF        4.300000                  
        Nop                                    
        PushF        1.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.200000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-5-true           
        Jump         -compare-5-false          
        Label        -compare-5-true           
        PushI        1                         
        Jump         -compare-5-join           
        Label        -compare-5-false          
        PushI        0                         
        Jump         -compare-5-join           
        Label        -compare-5-join           
        JumpTrue     -print-boolean-6-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-6-join     
        Label        -print-boolean-6-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-6-join     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-7-args          
        PushF        1.300000                  
        Nop                                    
        PushF        1.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.800000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-8-true           
        Jump         -compare-8-false          
        Label        -compare-8-true           
        PushI        1                         
        Jump         -compare-8-join           
        Label        -compare-8-false          
        PushI        0                         
        Jump         -compare-8-join           
        Label        -compare-8-join           
        JumpTrue     -print-boolean-9-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-9-join     
        Label        -print-boolean-9-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-9-join     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-10-args         
        PushF        4.300000                  
        Nop                                    
        PushF        8.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.100000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-11-true          
        Jump         -compare-11-false         
        Label        -compare-11-true          
        PushI        1                         
        Jump         -compare-11-join          
        Label        -compare-11-false         
        PushI        0                         
        Jump         -compare-11-join          
        Label        -compare-11-join          
        JumpTrue     -print-boolean-12-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-12-join    
        Label        -print-boolean-12-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-12-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-13-args         
        PushF        4.900000                  
        Nop                                    
        PushF        1.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.600000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-14-true          
        Jump         -compare-14-false         
        Label        -compare-14-true          
        PushI        1                         
        Jump         -compare-14-join          
        Label        -compare-14-false         
        PushI        0                         
        Jump         -compare-14-join          
        Label        -compare-14-join          
        JumpTrue     -print-boolean-15-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-15-join    
        Label        -print-boolean-15-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-15-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-16-args         
        PushF        3.700000                  
        Nop                                    
        PushF        2.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-17-true          
        Jump         -compare-17-false         
        Label        -compare-17-true          
        PushI        1                         
        Jump         -compare-17-join          
        Label        -compare-17-false         
        PushI        0                         
        Jump         -compare-17-join          
        Label        -compare-17-join          
        JumpTrue     -print-boolean-18-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-18-join    
        Label        -print-boolean-18-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-18-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-19-args         
        PushF        6.300000                  
        Nop                                    
        PushF        2.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.300000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-20-true          
        Jump         -compare-20-false         
        Label        -compare-20-true          
        PushI        1                         
        Jump         -compare-20-join          
        Label        -compare-20-false         
        PushI        0                         
        Jump         -compare-20-join          
        Label        -compare-20-join          
        JumpTrue     -print-boolean-21-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-21-join    
        Label        -print-boolean-21-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-21-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-22-args         
        PushF        1.600000                  
        Nop                                    
        PushF        4.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.900000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-23-true          
        Jump         -compare-23-false         
        Label        -compare-23-true          
        PushI        1                         
        Jump         -compare-23-join          
        Label        -compare-23-false         
        PushI        0                         
        Jump         -compare-23-join          
        Label        -compare-23-join          
        JumpTrue     -print-boolean-24-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-24-join    
        Label        -print-boolean-24-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-24-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-25-args         
        PushF        5.200000                  
        Nop                                    
        PushF        7.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.100000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-26-true          
        Jump         -compare-26-false         
        Label        -compare-26-true          
        PushI        1                         
        Jump         -compare-26-join          
        Label        -compare-26-false         
        PushI        0                         
        Jump         -compare-26-join          
        Label        -compare-26-join          
        JumpTrue     -print-boolean-27-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-27-join    
        Label        -print-boolean-27-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-27-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-28-args         
        PushF        6.800000                  
        Nop                                    
        PushF        7.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.400000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-29-true          
        Jump         -compare-29-false         
        Label        -compare-29-true          
        PushI        1                         
        Jump         -compare-29-join          
        Label        -compare-29-false         
        PushI        0                         
        Jump         -compare-29-join          
        Label        -compare-29-join          
        JumpTrue     -print-boolean-30-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-30-join    
        Label        -print-boolean-30-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-30-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-31-args         
        PushF        3.700000                  
        Nop                                    
        PushF        2.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.200000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-32-true          
        Jump         -compare-32-false         
        Label        -compare-32-true          
        PushI        1                         
        Jump         -compare-32-join          
        Label        -compare-32-false         
        PushI        0                         
        Jump         -compare-32-join          
        Label        -compare-32-join          
        JumpTrue     -print-boolean-33-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-33-join    
        Label        -print-boolean-33-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-33-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-34-args         
        PushF        5.000000                  
        Nop                                    
        PushF        2.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.300000                  
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-35-true          
        Jump         -compare-35-false         
        Label        -compare-35-true          
        PushI        1                         
        Jump         -compare-35-join          
        Label        -compare-35-false         
        PushI        0                         
        Jump         -compare-35-join          
        Label        -compare-35-join          
        JumpTrue     -print-boolean-36-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-36-join    
        Label        -print-boolean-36-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-36-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        8.700000                  
        Nop                                    
        Label        -Operator-37-args         
        PushF        6.100000                  
        Nop                                    
        PushF        6.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-38-true          
        Jump         -compare-38-false         
        Label        -compare-38-true          
        PushI        1                         
        Jump         -compare-38-join          
        Label        -compare-38-false         
        PushI        0                         
        Jump         -compare-38-join          
        Label        -compare-38-join          
        JumpTrue     -print-boolean-39-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-39-join    
        Label        -print-boolean-39-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-39-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        4.300000                  
        Nop                                    
        Label        -Operator-40-args         
        PushF        6.300000                  
        Nop                                    
        PushF        1.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-41-true          
        Jump         -compare-41-false         
        Label        -compare-41-true          
        PushI        1                         
        Jump         -compare-41-join          
        Label        -compare-41-false         
        PushI        0                         
        Jump         -compare-41-join          
        Label        -compare-41-join          
        JumpTrue     -print-boolean-42-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-42-join    
        Label        -print-boolean-42-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-42-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        4.700000                  
        Nop                                    
        Label        -Operator-43-args         
        PushF        7.400000                  
        Nop                                    
        PushF        1.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-44-true          
        Jump         -compare-44-false         
        Label        -compare-44-true          
        PushI        1                         
        Jump         -compare-44-join          
        Label        -compare-44-false         
        PushI        0                         
        Jump         -compare-44-join          
        Label        -compare-44-join          
        JumpTrue     -print-boolean-45-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-45-join    
        Label        -print-boolean-45-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-45-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        3.900000                  
        Nop                                    
        Label        -Operator-46-args         
        PushF        7.900000                  
        Nop                                    
        PushF        4.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-47-true          
        Jump         -compare-47-false         
        Label        -compare-47-true          
        PushI        1                         
        Jump         -compare-47-join          
        Label        -compare-47-false         
        PushI        0                         
        Jump         -compare-47-join          
        Label        -compare-47-join          
        JumpTrue     -print-boolean-48-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-48-join    
        Label        -print-boolean-48-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-48-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        6.600000                  
        Nop                                    
        Label        -Operator-49-args         
        PushF        2.800000                  
        Nop                                    
        PushF        5.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-50-true          
        Jump         -compare-50-false         
        Label        -compare-50-true          
        PushI        1                         
        Jump         -compare-50-join          
        Label        -compare-50-false         
        PushI        0                         
        Jump         -compare-50-join          
        Label        -compare-50-join          
        JumpTrue     -print-boolean-51-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-51-join    
        Label        -print-boolean-51-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-51-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        8.500000                  
        Nop                                    
        Label        -Operator-52-args         
        PushF        3.100000                  
        Nop                                    
        PushF        7.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-53-true          
        Jump         -compare-53-false         
        Label        -compare-53-true          
        PushI        1                         
        Jump         -compare-53-join          
        Label        -compare-53-false         
        PushI        0                         
        Jump         -compare-53-join          
        Label        -compare-53-join          
        JumpTrue     -print-boolean-54-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-54-join    
        Label        -print-boolean-54-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-54-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        8.100000                  
        Nop                                    
        Label        -Operator-55-args         
        PushF        4.300000                  
        Nop                                    
        PushF        8.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-56-true          
        Jump         -compare-56-false         
        Label        -compare-56-true          
        PushI        1                         
        Jump         -compare-56-join          
        Label        -compare-56-false         
        PushI        0                         
        Jump         -compare-56-join          
        Label        -compare-56-join          
        JumpTrue     -print-boolean-57-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-57-join    
        Label        -print-boolean-57-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-57-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        9.200000                  
        Nop                                    
        Label        -Operator-58-args         
        PushF        4.000000                  
        Nop                                    
        PushF        4.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-59-true          
        Jump         -compare-59-false         
        Label        -compare-59-true          
        PushI        1                         
        Jump         -compare-59-join          
        Label        -compare-59-false         
        PushI        0                         
        Jump         -compare-59-join          
        Label        -compare-59-join          
        JumpTrue     -print-boolean-60-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-60-join    
        Label        -print-boolean-60-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-60-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        2.200000                  
        Nop                                    
        Label        -Operator-61-args         
        PushF        5.900000                  
        Nop                                    
        PushF        3.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-62-true          
        Jump         -compare-62-false         
        Label        -compare-62-true          
        PushI        1                         
        Jump         -compare-62-join          
        Label        -compare-62-false         
        PushI        0                         
        Jump         -compare-62-join          
        Label        -compare-62-join          
        JumpTrue     -print-boolean-63-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-63-join    
        Label        -print-boolean-63-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-63-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        2.900000                  
        Nop                                    
        Label        -Operator-64-args         
        PushF        6.300000                  
        Nop                                    
        PushF        7.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-65-true          
        Jump         -compare-65-false         
        Label        -compare-65-true          
        PushI        1                         
        Jump         -compare-65-join          
        Label        -compare-65-false         
        PushI        0                         
        Jump         -compare-65-join          
        Label        -compare-65-join          
        JumpTrue     -print-boolean-66-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-66-join    
        Label        -print-boolean-66-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-66-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        5.500000                  
        Nop                                    
        Label        -Operator-67-args         
        PushF        7.000000                  
        Nop                                    
        PushF        8.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-68-true          
        Jump         -compare-68-false         
        Label        -compare-68-true          
        PushI        1                         
        Jump         -compare-68-join          
        Label        -compare-68-false         
        PushI        0                         
        Jump         -compare-68-join          
        Label        -compare-68-join          
        JumpTrue     -print-boolean-69-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-69-join    
        Label        -print-boolean-69-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-69-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushF        3.700000                  
        Nop                                    
        Label        -Operator-70-args         
        PushF        7.300000                  
        Nop                                    
        PushF        6.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-71-true          
        Jump         -compare-71-false         
        Label        -compare-71-true          
        PushI        1                         
        Jump         -compare-71-join          
        Label        -compare-71-false         
        PushI        0                         
        Jump         -compare-71-join          
        Label        -compare-71-join          
        JumpTrue     -print-boolean-72-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-72-join    
        Label        -print-boolean-72-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-72-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-73-args         
        PushF        3.300000                  
        Nop                                    
        PushF        5.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-74-args         
        PushF        1.900000                  
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-75-true          
        Jump         -compare-75-false         
        Label        -compare-75-true          
        PushI        1                         
        Jump         -compare-75-join          
        Label        -compare-75-false         
        PushI        0                         
        Jump         -compare-75-join          
        Label        -compare-75-join          
        JumpTrue     -print-boolean-76-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-76-join    
        Label        -print-boolean-76-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-76-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-77-args         
        PushF        4.200000                  
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-78-args         
        PushF        1.400000                  
        Nop                                    
        PushF        3.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-79-true          
        Jump         -compare-79-false         
        Label        -compare-79-true          
        PushI        1                         
        Jump         -compare-79-join          
        Label        -compare-79-false         
        PushI        0                         
        Jump         -compare-79-join          
        Label        -compare-79-join          
        JumpTrue     -print-boolean-80-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-80-join    
        Label        -print-boolean-80-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-80-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-81-args         
        PushF        8.600000                  
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-82-args         
        PushF        3.600000                  
        Nop                                    
        PushF        6.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-83-true          
        Jump         -compare-83-false         
        Label        -compare-83-true          
        PushI        1                         
        Jump         -compare-83-join          
        Label        -compare-83-false         
        PushI        0                         
        Jump         -compare-83-join          
        Label        -compare-83-join          
        JumpTrue     -print-boolean-84-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-84-join    
        Label        -print-boolean-84-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-84-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-85-args         
        PushF        5.300000                  
        Nop                                    
        PushF        9.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-86-args         
        PushF        2.500000                  
        Nop                                    
        PushF        1.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-87-true          
        Jump         -compare-87-false         
        Label        -compare-87-true          
        PushI        1                         
        Jump         -compare-87-join          
        Label        -compare-87-false         
        PushI        0                         
        Jump         -compare-87-join          
        Label        -compare-87-join          
        JumpTrue     -print-boolean-88-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-88-join    
        Label        -print-boolean-88-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-88-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-89-args         
        PushF        2.200000                  
        Nop                                    
        PushF        1.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-90-args         
        PushF        6.400000                  
        Nop                                    
        PushF        6.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-91-true          
        Jump         -compare-91-false         
        Label        -compare-91-true          
        PushI        1                         
        Jump         -compare-91-join          
        Label        -compare-91-false         
        PushI        0                         
        Jump         -compare-91-join          
        Label        -compare-91-join          
        JumpTrue     -print-boolean-92-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-92-join    
        Label        -print-boolean-92-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-92-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-93-args         
        PushF        8.000000                  
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-94-args         
        PushF        8.500000                  
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-95-true          
        Jump         -compare-95-false         
        Label        -compare-95-true          
        PushI        1                         
        Jump         -compare-95-join          
        Label        -compare-95-false         
        PushI        0                         
        Jump         -compare-95-join          
        Label        -compare-95-join          
        JumpTrue     -print-boolean-96-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-96-join    
        Label        -print-boolean-96-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-96-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-97-args         
        PushF        6.100000                  
        Nop                                    
        PushF        2.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-98-args         
        PushF        7.700000                  
        Nop                                    
        PushF        1.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-99-true          
        Jump         -compare-99-false         
        Label        -compare-99-true          
        PushI        1                         
        Jump         -compare-99-join          
        Label        -compare-99-false         
        PushI        0                         
        Jump         -compare-99-join          
        Label        -compare-99-join          
        JumpTrue     -print-boolean-100-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-100-join   
        Label        -print-boolean-100-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-100-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-101-args        
        PushF        7.100000                  
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-102-args        
        PushF        7.500000                  
        Nop                                    
        PushF        2.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-103-true         
        Jump         -compare-103-false        
        Label        -compare-103-true         
        PushI        1                         
        Jump         -compare-103-join         
        Label        -compare-103-false        
        PushI        0                         
        Jump         -compare-103-join         
        Label        -compare-103-join         
        JumpTrue     -print-boolean-104-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-104-join   
        Label        -print-boolean-104-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-104-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-105-args        
        PushF        7.400000                  
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-106-args        
        PushF        1.900000                  
        Nop                                    
        PushF        3.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-107-true         
        Jump         -compare-107-false        
        Label        -compare-107-true         
        PushI        1                         
        Jump         -compare-107-join         
        Label        -compare-107-false        
        PushI        0                         
        Jump         -compare-107-join         
        Label        -compare-107-join         
        JumpTrue     -print-boolean-108-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-108-join   
        Label        -print-boolean-108-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-108-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-109-args        
        PushF        6.500000                  
        Nop                                    
        PushF        4.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-110-args        
        PushF        1.700000                  
        Nop                                    
        PushF        9.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-111-true         
        Jump         -compare-111-false        
        Label        -compare-111-true         
        PushI        1                         
        Jump         -compare-111-join         
        Label        -compare-111-false        
        PushI        0                         
        Jump         -compare-111-join         
        Label        -compare-111-join         
        JumpTrue     -print-boolean-112-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-112-join   
        Label        -print-boolean-112-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-112-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-113-args        
        PushF        6.900000                  
        Nop                                    
        PushF        2.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-114-args        
        PushF        8.600000                  
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-115-true         
        Jump         -compare-115-false        
        Label        -compare-115-true         
        PushI        1                         
        Jump         -compare-115-join         
        Label        -compare-115-false        
        PushI        0                         
        Jump         -compare-115-join         
        Label        -compare-115-join         
        JumpTrue     -print-boolean-116-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-116-join   
        Label        -print-boolean-116-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-116-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-117-args        
        PushF        4.600000                  
        Nop                                    
        PushF        9.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-118-args        
        PushF        4.100000                  
        Nop                                    
        PushF        8.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        JumpFNeg     -compare-119-true         
        Jump         -compare-119-false        
        Label        -compare-119-true         
        PushI        1                         
        Jump         -compare-119-join         
        Label        -compare-119-false        
        PushI        0                         
        Jump         -compare-119-join         
        Label        -compare-119-join         
        JumpTrue     -print-boolean-120-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-120-join   
        Label        -print-boolean-120-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-120-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
