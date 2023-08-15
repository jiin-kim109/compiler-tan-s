        Label        -mem-manager-initialize   
        DLabel       $heap-start-ptr           
        DataZ        4                         
        DLabel       $heap-after-ptr           
        DataZ        4                         
        DLabel       $heap-first-free          
        DataZ        4                         
        DLabel       $mmgr-newblock-block      
        DataZ        4                         
        DLabel       $mmgr-newblock-size       
        DataZ        4                         
        PushD        $heap-memory              
        Duplicate                              
        PushD        $heap-start-ptr           
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        DLabel       $frame-pointer            
        DataZ        4                         
        PushD        $frame-pointer            
        Memtop                                 
        StoreI                                 
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
        DLabel       $errors-bad-typecast-operand 
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
        Label        $$bad-typecast-operand    
        PushD        $errors-bad-typecast-operand 
        Jump         $$general-runtime-error   
        DLabel       $errors-index-out-of-bound 
        DataC        105                       %% "index out of bound"
        DataC        110                       
        DataC        100                       
        DataC        101                       
        DataC        120                       
        DataC        32                        
        DataC        111                       
        DataC        117                       
        DataC        116                       
        DataC        32                        
        DataC        111                       
        DataC        102                       
        DataC        32                        
        DataC        98                        
        DataC        111                       
        DataC        117                       
        DataC        110                       
        DataC        100                       
        DataC        0                         
        Label        $$index-out-of-bound      
        PushD        $errors-index-out-of-bound 
        Jump         $$general-runtime-error   
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        0                         
        Label        $$main                    
        Label        -Operator-2-args          
        PushF        5.500000                  
        Nop                                    
        Label        -Operator-1-args          
        PushF        8.700000                  
        Nop                                    
        PushF        4.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-4-args          
        PushF        8.100000                  
        Nop                                    
        Label        -Operator-3-args          
        PushF        6.800000                  
        Nop                                    
        PushF        4.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-6-args          
        PushF        4.300000                  
        Nop                                    
        Label        -Operator-5-args          
        PushF        1.000000                  
        Nop                                    
        PushF        5.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-8-args          
        PushF        5.300000                  
        Nop                                    
        Label        -Operator-7-args          
        PushF        8.400000                  
        Nop                                    
        PushF        1.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-10-args         
        PushF        6.600000                  
        Nop                                    
        Label        -Operator-9-args          
        PushF        2.000000                  
        Nop                                    
        PushF        6.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-12-args         
        PushF        7.700000                  
        Nop                                    
        Label        -Operator-11-args         
        PushF        3.600000                  
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-14-args         
        PushF        8.500000                  
        Nop                                    
        Label        -Operator-13-args         
        PushF        4.000000                  
        Nop                                    
        PushF        4.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-16-args         
        PushF        7.100000                  
        Nop                                    
        Label        -Operator-15-args         
        PushF        6.400000                  
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-18-args         
        PushF        5.600000                  
        Nop                                    
        Label        -Operator-17-args         
        PushF        6.200000                  
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-20-args         
        PushF        2.400000                  
        Nop                                    
        Label        -Operator-19-args         
        PushF        3.200000                  
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-22-args         
        PushF        3.300000                  
        Nop                                    
        Label        -Operator-21-args         
        PushF        4.700000                  
        Nop                                    
        PushF        2.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-24-args         
        PushF        3.700000                  
        Nop                                    
        Label        -Operator-23-args         
        PushF        4.000000                  
        Nop                                    
        PushF        7.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-26-args         
        Label        -Operator-25-args         
        PushF        5.300000                  
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.900000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-28-args         
        Label        -Operator-27-args         
        PushF        3.200000                  
        Nop                                    
        PushF        1.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.700000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-30-args         
        Label        -Operator-29-args         
        PushF        5.500000                  
        Nop                                    
        PushF        3.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.900000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-32-args         
        Label        -Operator-31-args         
        PushF        8.000000                  
        Nop                                    
        PushF        6.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        6.800000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-34-args         
        Label        -Operator-33-args         
        PushF        3.400000                  
        Nop                                    
        PushF        7.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        7.600000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-36-args         
        Label        -Operator-35-args         
        PushF        5.300000                  
        Nop                                    
        PushF        8.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.700000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-38-args         
        Label        -Operator-37-args         
        PushF        9.200000                  
        Nop                                    
        PushF        3.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-40-args         
        Label        -Operator-39-args         
        PushF        6.100000                  
        Nop                                    
        PushF        2.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        4.800000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-42-args         
        Label        -Operator-41-args         
        PushF        6.800000                  
        Nop                                    
        PushF        3.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        9.400000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-44-args         
        Label        -Operator-43-args         
        PushF        8.900000                  
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        2.600000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-46-args         
        Label        -Operator-45-args         
        PushF        1.400000                  
        Nop                                    
        PushF        5.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        8.900000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-48-args         
        Label        -Operator-47-args         
        PushF        1.000000                  
        Nop                                    
        PushF        4.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-51-args         
        Label        -Operator-50-args         
        PushF        6.200000                  
        Nop                                    
        Label        -Operator-49-args         
        PushF        8.400000                  
        Nop                                    
        PushF        9.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        9.900000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-54-args         
        Label        -Operator-53-args         
        PushF        7.600000                  
        Nop                                    
        Label        -Operator-52-args         
        PushF        1.200000                  
        Nop                                    
        PushF        2.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        2.800000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-57-args         
        Label        -Operator-56-args         
        PushF        6.900000                  
        Nop                                    
        Label        -Operator-55-args         
        PushF        9.700000                  
        Nop                                    
        PushF        7.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        5.700000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-60-args         
        Label        -Operator-59-args         
        PushF        4.200000                  
        Nop                                    
        Label        -Operator-58-args         
        PushF        2.400000                  
        Nop                                    
        PushF        3.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        9.200000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-63-args         
        Label        -Operator-62-args         
        PushF        4.500000                  
        Nop                                    
        Label        -Operator-61-args         
        PushF        6.500000                  
        Nop                                    
        PushF        5.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        8.400000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-66-args         
        Label        -Operator-65-args         
        PushF        2.000000                  
        Nop                                    
        Label        -Operator-64-args         
        PushF        5.900000                  
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        8.500000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-69-args         
        Label        -Operator-68-args         
        PushF        3.200000                  
        Nop                                    
        Label        -Operator-67-args         
        PushF        4.800000                  
        Nop                                    
        PushF        9.400000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        7.400000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-72-args         
        Label        -Operator-71-args         
        PushF        3.300000                  
        Nop                                    
        Label        -Operator-70-args         
        PushF        6.500000                  
        Nop                                    
        PushF        1.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        4.200000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-75-args         
        Label        -Operator-74-args         
        PushF        3.100000                  
        Nop                                    
        Label        -Operator-73-args         
        PushF        4.100000                  
        Nop                                    
        PushF        2.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        3.600000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-78-args         
        Label        -Operator-77-args         
        PushF        7.300000                  
        Nop                                    
        Label        -Operator-76-args         
        PushF        5.900000                  
        Nop                                    
        PushF        3.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        1.000000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-81-args         
        Label        -Operator-80-args         
        PushF        3.300000                  
        Nop                                    
        Label        -Operator-79-args         
        PushF        1.600000                  
        Nop                                    
        PushF        4.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        3.000000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-84-args         
        Label        -Operator-83-args         
        PushF        2.300000                  
        Nop                                    
        Label        -Operator-82-args         
        PushF        1.100000                  
        Nop                                    
        PushF        7.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        Nop                                    
        PushF        4.200000                  
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-87-args         
        Label        -Operator-85-args         
        PushF        9.300000                  
        Nop                                    
        PushF        4.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-86-args         
        PushF        8.900000                  
        Nop                                    
        PushF        1.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-90-args         
        Label        -Operator-88-args         
        PushF        4.500000                  
        Nop                                    
        PushF        2.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-89-args         
        PushF        1.300000                  
        Nop                                    
        PushF        5.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-93-args         
        Label        -Operator-91-args         
        PushF        9.100000                  
        Nop                                    
        PushF        7.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-92-args         
        PushF        5.300000                  
        Nop                                    
        PushF        7.500000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-96-args         
        Label        -Operator-94-args         
        PushF        5.500000                  
        Nop                                    
        PushF        7.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-95-args         
        PushF        6.800000                  
        Nop                                    
        PushF        6.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-99-args         
        Label        -Operator-97-args         
        PushF        4.600000                  
        Nop                                    
        PushF        6.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-98-args         
        PushF        7.900000                  
        Nop                                    
        PushF        9.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-102-args        
        Label        -Operator-100-args        
        PushF        3.100000                  
        Nop                                    
        PushF        6.800000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-101-args        
        PushF        4.200000                  
        Nop                                    
        PushF        5.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-105-args        
        Label        -Operator-103-args        
        PushF        6.400000                  
        Nop                                    
        PushF        8.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-104-args        
        PushF        2.000000                  
        Nop                                    
        PushF        4.200000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-108-args        
        Label        -Operator-106-args        
        PushF        3.300000                  
        Nop                                    
        PushF        7.600000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-107-args        
        PushF        9.000000                  
        Nop                                    
        PushF        3.000000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-111-args        
        Label        -Operator-109-args        
        PushF        2.500000                  
        Nop                                    
        PushF        7.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-110-args        
        PushF        5.200000                  
        Nop                                    
        PushF        1.100000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-114-args        
        Label        -Operator-112-args        
        PushF        7.200000                  
        Nop                                    
        PushF        8.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-113-args        
        PushF        1.700000                  
        Nop                                    
        PushF        2.700000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-117-args        
        Label        -Operator-115-args        
        PushF        3.400000                  
        Nop                                    
        PushF        1.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-116-args        
        PushF        6.800000                  
        Nop                                    
        PushF        6.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-120-args        
        Label        -Operator-118-args        
        PushF        1.700000                  
        Nop                                    
        PushF        4.900000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        Label        -Operator-119-args        
        PushF        5.400000                  
        Nop                                    
        PushF        7.300000                  
        Nop                                    
        FMultiply                              
        Nop                                    
        FSubtract                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
        Label        -mem-manager-make-tags    
        DLabel       $mmgr-tags-size           
        DataZ        4                         
        DLabel       $mmgr-tags-start          
        DataZ        4                         
        DLabel       $mmgr-tags-available      
        DataZ        4                         
        DLabel       $mmgr-tags-nextptr        
        DataZ        4                         
        DLabel       $mmgr-tags-prevptr        
        DataZ        4                         
        DLabel       $mmgr-tags-return         
        DataZ        4                         
        PushD        $mmgr-tags-return         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-size           
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-start          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-available      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-nextptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-nextptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-return         
        LoadI                                  
        Return                                 
        Label        -mem-manager-one-tag      
        DLabel       $mmgr-onetag-return       
        DataZ        4                         
        DLabel       $mmgr-onetag-location     
        DataZ        4                         
        DLabel       $mmgr-onetag-available    
        DataZ        4                         
        DLabel       $mmgr-onetag-size         
        DataZ        4                         
        DLabel       $mmgr-onetag-pointer      
        DataZ        4                         
        PushD        $mmgr-onetag-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-onetag-return       
        LoadI                                  
        Return                                 
        Label        -mem-manager-allocate     
        DLabel       $mmgr-alloc-return        
        DataZ        4                         
        DLabel       $mmgr-alloc-size          
        DataZ        4                         
        DLabel       $mmgr-alloc-current-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-size 
        DataZ        4                         
        PushD        $mmgr-alloc-return        
        Exchange                               
        StoreI                                 
        PushI        18                        
        Add                                    
        PushD        $mmgr-alloc-size          
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-process-current 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    -mmgr-alloc-no-block-works 
        Label        -mmgr-alloc-test-block    
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        1                         
        Add                                    
        JumpPos      -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Jump         -mmgr-alloc-process-current 
        Label        -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Call         -mem-manager-remove-block 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        26                        
        Subtract                               
        JumpNeg      -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Add                                    
        PushD        $mmgr-alloc-remainder-block 
        Exchange                               
        StoreI                                 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        PushD        $mmgr-alloc-remainder-size 
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushI        0                         
        PushI        0                         
        PushI        1                         
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushD        $mmgr-alloc-remainder-size 
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        Call         -mem-manager-deallocate   
        Jump         -mmgr-alloc-return-userblock 
        Label        -mmgr-alloc-no-block-works 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-newblock-size       
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        LoadI                                  
        PushD        $mmgr-newblock-block      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-newblock-size       
        LoadI                                  
        PushD        $heap-after-ptr           
        LoadI                                  
        Add                                    
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-newblock-size       
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        -mem-manager-deallocate   
        DLabel       $mmgr-dealloc-return      
        DataZ        4                         
        DLabel       $mmgr-dealloc-block       
        DataZ        4                         
        PushD        $mmgr-dealloc-return      
        Exchange                               
        StoreI                                 
        PushI        9                         
        Subtract                               
        PushD        $mmgr-dealloc-block       
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        JumpFalse    -mmgr-bypass-firstFree    
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -mmgr-bypass-firstFree    
        PushI        0                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-dealloc-return      
        LoadI                                  
        Return                                 
        Label        -mem-manager-remove-block 
        DLabel       $mmgr-remove-return       
        DataZ        4                         
        DLabel       $mmgr-remove-block        
        DataZ        4                         
        DLabel       $mmgr-remove-prev         
        DataZ        4                         
        DLabel       $mmgr-remove-next         
        DataZ        4                         
        PushD        $mmgr-remove-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-prev         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-next         
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-prev 
        PushD        $mmgr-remove-prev         
        LoadI                                  
        JumpFalse    -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $mmgr-remove-prev         
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         -mmgr-remove-process-next 
        Label        -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-next 
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    -mmgr-remove-done         
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-done         
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
        DLabel       $heap-memory              
