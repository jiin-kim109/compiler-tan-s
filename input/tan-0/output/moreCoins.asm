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
        DataC        32                        %% "    "
        DataC        32                        
        DataC        32                        
        DataC        32                        
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
        DataZ        32                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% toonies
        PushI        2                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% loonies
        PushI        3                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% quarters
        PushI        5                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% dimes
        PushI        3                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% nickels
        PushI        7                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% pennies
        PushI        17                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% value
        Label        -Operator-10-args         
        Label        -Operator-9-args          
        Label        -Operator-7-args          
        Label        -Operator-5-args          
        Label        -Operator-3-args          
        Label        -Operator-1-args          
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% toonies
        LoadI                                  
        PushI        200                       
        Multiply                               
        Label        -Operator-2-args          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% loonies
        LoadI                                  
        PushI        100                       
        Multiply                               
        Add                                    
        Label        -Operator-4-args          
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% quarters
        LoadI                                  
        PushI        25                        
        Multiply                               
        Add                                    
        Label        -Operator-6-args          
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% dimes
        LoadI                                  
        PushI        10                        
        Multiply                               
        Add                                    
        Label        -Operator-8-args          
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% nickels
        LoadI                                  
        PushI        5                         
        Multiply                               
        Add                                    
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% pennies
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% value
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% ncoins
        Label        -Operator-15-args         
        Label        -Operator-14-args         
        Label        -Operator-13-args         
        Label        -Operator-12-args         
        Label        -Operator-11-args         
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% toonies
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% loonies
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% quarters
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% dimes
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% nickels
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% pennies
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% ncoins
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
