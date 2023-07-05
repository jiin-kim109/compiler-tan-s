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
        PushI        0                         
        Nop                                    
        PushI        41                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        9.200000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-2-args          
        PushI        0                         
        Nop                                    
        PushI        66                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        5.400000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-3-args          
        PushI        0                         
        Nop                                    
        PushI        83                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        6.000000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-4-args          
        PushI        0                         
        Nop                                    
        PushI        48                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        5.400000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-5-args          
        PushI        0                         
        Nop                                    
        PushI        44                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        8.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-6-args          
        PushI        0                         
        Nop                                    
        PushI        63                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        1.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-7-args          
        PushI        0                         
        Nop                                    
        PushI        95                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        5.700000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-8-args          
        PushI        0                         
        Nop                                    
        PushI        71                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        2.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-9-args          
        PushI        0                         
        Nop                                    
        PushI        42                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        2.500000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-10-args         
        PushI        0                         
        Nop                                    
        PushI        20                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        5.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-11-args         
        PushI        0                         
        Nop                                    
        PushI        62                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        4.100000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-12-args         
        PushI        0                         
        Nop                                    
        PushI        4                         
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushF        1.600000                  
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-13-args         
        PushF        9.400000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        68                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-14-args         
        PushF        8.200000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        95                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-15-args         
        PushF        4.400000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        80                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-16-args         
        PushF        3.800000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        76                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-17-args         
        PushF        8.600000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        19                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-18-args         
        PushF        3.300000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        42                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-19-args         
        PushF        5.300000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        32                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-20-args         
        PushF        6.900000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        62                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-21-args         
        PushF        8.400000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        5                         
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-22-args         
        PushF        3.700000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        65                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-23-args         
        PushF        9.900000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        23                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-24-args         
        PushF        5.900000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        61                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-25-args         
        PushI        0                         
        Nop                                    
        PushI        2                         
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        22                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-26-args         
        PushI        0                         
        Nop                                    
        PushI        12                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-27-args         
        PushI        0                         
        Nop                                    
        PushI        61                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        94                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-28-args         
        PushI        0                         
        Nop                                    
        PushI        12                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        75                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-29-args         
        PushI        0                         
        Nop                                    
        PushI        58                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        8                         
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-30-args         
        PushI        0                         
        Nop                                    
        PushI        8                         
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        27                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-31-args         
        PushI        0                         
        Nop                                    
        PushI        4                         
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        49                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-32-args         
        PushI        0                         
        Nop                                    
        PushI        95                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        19                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-33-args         
        PushI        0                         
        Nop                                    
        PushI        55                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        35                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-34-args         
        PushI        0                         
        Nop                                    
        PushI        20                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        43                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-35-args         
        PushI        0                         
        Nop                                    
        PushI        78                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        87                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -Operator-36-args         
        PushI        0                         
        Nop                                    
        PushI        26                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        77                        
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FMultiply                              
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
