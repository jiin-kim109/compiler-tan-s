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
        Label        -Operator-2-args          
        Label        -Operator-1-args          
        PushF        9.600000                  
        Nop                                    
        PushF        8.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-4-args          
        Label        -Operator-3-args          
        PushF        3.000000                  
        Nop                                    
        PushF        2.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.300000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-6-args          
        Label        -Operator-5-args          
        PushF        2.300000                  
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-8-args          
        Label        -Operator-7-args          
        PushF        1.500000                  
        Nop                                    
        PushF        9.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-10-args         
        Label        -Operator-9-args          
        PushF        6.200000                  
        Nop                                    
        PushF        9.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-12-args         
        Label        -Operator-11-args         
        PushF        3.700000                  
        Nop                                    
        PushF        6.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-14-args         
        Label        -Operator-13-args         
        PushF        2.100000                  
        Nop                                    
        PushF        8.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-16-args         
        Label        -Operator-15-args         
        PushF        3.100000                  
        Nop                                    
        PushF        5.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.300000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-18-args         
        Label        -Operator-17-args         
        PushF        6.000000                  
        Nop                                    
        PushF        5.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-20-args         
        Label        -Operator-19-args         
        PushF        1.600000                  
        Nop                                    
        PushF        4.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.400000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-22-args         
        Label        -Operator-21-args         
        PushF        3.900000                  
        Nop                                    
        PushF        1.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-24-args         
        Label        -Operator-23-args         
        PushF        8.000000                  
        Nop                                    
        PushF        5.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-26-args         
        Label        -Operator-25-args         
        PushF        9.300000                  
        Nop                                    
        PushF        9.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-28-args         
        Label        -Operator-27-args         
        PushF        9.700000                  
        Nop                                    
        PushF        9.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-30-args         
        Label        -Operator-29-args         
        PushF        2.600000                  
        Nop                                    
        PushF        6.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.300000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-32-args         
        Label        -Operator-31-args         
        PushF        3.300000                  
        Nop                                    
        PushF        1.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-34-args         
        Label        -Operator-33-args         
        PushF        2.300000                  
        Nop                                    
        PushF        2.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-36-args         
        Label        -Operator-35-args         
        PushF        1.700000                  
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-38-args         
        Label        -Operator-37-args         
        PushF        6.000000                  
        Nop                                    
        PushF        1.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-40-args         
        Label        -Operator-39-args         
        PushF        9.600000                  
        Nop                                    
        PushF        9.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.900000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-42-args         
        Label        -Operator-41-args         
        PushF        5.100000                  
        Nop                                    
        PushF        3.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-44-args         
        Label        -Operator-43-args         
        PushF        8.900000                  
        Nop                                    
        PushF        6.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-46-args         
        Label        -Operator-45-args         
        PushF        3.200000                  
        Nop                                    
        PushF        4.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-48-args         
        Label        -Operator-47-args         
        PushF        1.900000                  
        Nop                                    
        PushF        2.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.300000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-51-args         
        Label        -Operator-50-args         
        Label        -Operator-49-args         
        PushF        1.000000                  
        Nop                                    
        PushF        6.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-54-args         
        Label        -Operator-53-args         
        Label        -Operator-52-args         
        PushF        6.200000                  
        Nop                                    
        PushF        6.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-57-args         
        Label        -Operator-56-args         
        Label        -Operator-55-args         
        PushF        5.000000                  
        Nop                                    
        PushF        2.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-60-args         
        Label        -Operator-59-args         
        Label        -Operator-58-args         
        PushF        9.700000                  
        Nop                                    
        PushF        3.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.400000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-63-args         
        Label        -Operator-62-args         
        Label        -Operator-61-args         
        PushF        4.700000                  
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-66-args         
        Label        -Operator-65-args         
        Label        -Operator-64-args         
        PushF        6.100000                  
        Nop                                    
        PushF        4.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-69-args         
        Label        -Operator-68-args         
        Label        -Operator-67-args         
        PushF        8.400000                  
        Nop                                    
        PushF        3.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-72-args         
        Label        -Operator-71-args         
        Label        -Operator-70-args         
        PushF        4.800000                  
        Nop                                    
        PushF        5.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-75-args         
        Label        -Operator-74-args         
        Label        -Operator-73-args         
        PushF        2.900000                  
        Nop                                    
        PushF        8.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-78-args         
        Label        -Operator-77-args         
        Label        -Operator-76-args         
        PushF        9.900000                  
        Nop                                    
        PushF        6.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-81-args         
        Label        -Operator-80-args         
        Label        -Operator-79-args         
        PushF        5.200000                  
        Nop                                    
        PushF        5.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-84-args         
        Label        -Operator-83-args         
        Label        -Operator-82-args         
        PushF        9.200000                  
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.400000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-87-args         
        Label        -Operator-86-args         
        Label        -Operator-85-args         
        PushF        8.200000                  
        Nop                                    
        PushF        1.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-90-args         
        Label        -Operator-89-args         
        Label        -Operator-88-args         
        PushF        3.600000                  
        Nop                                    
        PushF        9.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-93-args         
        Label        -Operator-92-args         
        Label        -Operator-91-args         
        PushF        6.900000                  
        Nop                                    
        PushF        8.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-96-args         
        Label        -Operator-95-args         
        Label        -Operator-94-args         
        PushF        2.900000                  
        Nop                                    
        PushF        7.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.400000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-99-args         
        Label        -Operator-98-args         
        Label        -Operator-97-args         
        PushF        6.600000                  
        Nop                                    
        PushF        1.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-102-args        
        Label        -Operator-101-args        
        Label        -Operator-100-args        
        PushF        7.100000                  
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-105-args        
        Label        -Operator-104-args        
        Label        -Operator-103-args        
        PushF        3.600000                  
        Nop                                    
        PushF        3.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-108-args        
        Label        -Operator-107-args        
        Label        -Operator-106-args        
        PushF        7.400000                  
        Nop                                    
        PushF        8.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-111-args        
        Label        -Operator-110-args        
        Label        -Operator-109-args        
        PushF        4.800000                  
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        5.800000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-114-args        
        Label        -Operator-113-args        
        Label        -Operator-112-args        
        PushF        9.100000                  
        Nop                                    
        PushF        4.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        3.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-117-args        
        Label        -Operator-116-args        
        Label        -Operator-115-args        
        PushF        7.600000                  
        Nop                                    
        PushF        1.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-120-args        
        Label        -Operator-119-args        
        Label        -Operator-118-args        
        PushF        6.900000                  
        Nop                                    
        PushF        7.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.300000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
