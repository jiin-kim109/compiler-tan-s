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
        DataZ        12                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% b
        PushI        0                         
        Nop                                    
        PushI        16                        
        DLabel       arrayLengthexpressionList0 
        DataZ        4                         
        PushI        2                         
        Duplicate                              
        PushD        arrayLengthexpressionList0 
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        DLabel       arrayAddressLabelexpressionList1 
        DataZ        4                         
        Duplicate                              
        PushD        arrayAddressLabelexpressionList1 
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        0                         
        Add                                    
        PushI        5                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        PushD        arrayLengthexpressionList0 
        LoadI                                  
        StoreI                                 
        PushD        arrayLengthexpressionList0 
        LoadI                                  
        Label        -arrayDefaultValueexpressionList2-1-loopStart 
        Duplicate                              
        JumpFalse    -arrayDefaultValueexpressionList2-1-loopEnd 
        PushI        1                         
        Subtract                               
        Duplicate                              
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        PushD        arrayAddressLabelexpressionList1 
        LoadI                                  
        Add                                    
        PushI        0                         
        StoreI                                 
        Jump         -arrayDefaultValueexpressionList2-1-loopStart 
        Label        -arrayDefaultValueexpressionList2-1-loopEnd 
        Pop                                    
        Duplicate                              
        PushI        16                        
        Add                                    
        PushI        3                         
        StoreI                                 
        Duplicate                              
        PushI        20                        
        Add                                    
        PushI        4                         
        PushI        12                        
        PushI        0                         
        StoreI                                 
        StoreI                                 
        Nop                                    
        Exchange                               
        Pop                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% c
        PushI        0                         
        Nop                                    
        PushI        16                        
        DLabel       arrayLengthexpressionList3 
        DataZ        4                         
        PushI        2                         
        Duplicate                              
        PushD        arrayLengthexpressionList3 
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        DLabel       arrayAddressLabelexpressionList4 
        DataZ        4                         
        Duplicate                              
        PushD        arrayAddressLabelexpressionList4 
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        0                         
        Add                                    
        PushI        5                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        PushD        arrayLengthexpressionList3 
        LoadI                                  
        StoreI                                 
        PushD        arrayLengthexpressionList3 
        LoadI                                  
        Label        -arrayDefaultValueexpressionList5-2-loopStart 
        Duplicate                              
        JumpFalse    -arrayDefaultValueexpressionList5-2-loopEnd 
        PushI        1                         
        Subtract                               
        Duplicate                              
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        PushD        arrayAddressLabelexpressionList4 
        LoadI                                  
        Add                                    
        PushI        0                         
        StoreI                                 
        Jump         -arrayDefaultValueexpressionList5-2-loopStart 
        Label        -arrayDefaultValueexpressionList5-2-loopEnd 
        Pop                                    
        Duplicate                              
        PushI        16                        
        Add                                    
        PushI        1                         
        StoreI                                 
        Duplicate                              
        PushI        20                        
        Add                                    
        PushI        2                         
        PushI        12                        
        PushI        0                         
        StoreI                                 
        StoreI                                 
        Nop                                    
        Exchange                               
        Pop                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% c
        LoadI                                  
        PushI        91                        
        PushD        $print-format-character   
        Printf                                 
        DLabel       printArrayAddress0        
        DataZ        4                         
        PushD        printArrayAddress0        
        Exchange                               
        StoreI                                 
        PushD        printArrayAddress0        
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushI        0                         
        Exchange                               
        Label        -arrayPrintLoop-3-arrayPrintLoopStartprintArrayAddress0 
        Duplicate                              
        JumpFalse    -arrayPrintLoop-3-arrayPrintLoopEndprintArrayAddress0 
        Exchange                               
        Duplicate                              
        JumpFalse    -arrayPrintLoop-3-arrayPrintLoopNoCommaprintArrayAddress0 
        PushI        44                        
        PushD        $print-format-character   
        Printf                                 
        PushI        32                        
        PushD        $print-format-character   
        Printf                                 
        Label        -arrayPrintLoop-3-arrayPrintLoopNoCommaprintArrayAddress0 
        Exchange                               
        PushI        1                         
        Subtract                               
        Exchange                               
        Duplicate                              
        PushI        4                         
        Multiply                               
        PushD        printArrayAddress0        
        LoadI                                  
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushI        1                         
        Add                                    
        Exchange                               
        Jump         -arrayPrintLoop-3-arrayPrintLoopStartprintArrayAddress0 
        Label        -arrayPrintLoop-3-arrayPrintLoopEndprintArrayAddress0 
        Pop                                    
        Pop                                    
        PushI        93                        
        PushD        $print-format-character   
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% t
        PushI        0                         
        Nop                                    
        PushI        16                        
        DLabel       arrayLengthexpressionList9 
        DataZ        4                         
        PushI        2                         
        Duplicate                              
        PushD        arrayLengthexpressionList9 
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        DLabel       arrayAddressLabelexpressionList10 
        DataZ        4                         
        Duplicate                              
        PushD        arrayAddressLabelexpressionList10 
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        0                         
        Add                                    
        PushI        5                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        PushI        2                         
        StoreI                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        PushD        arrayLengthexpressionList9 
        LoadI                                  
        StoreI                                 
        PushD        arrayLengthexpressionList9 
        LoadI                                  
        Label        -arrayDefaultValueexpressionList11-5-loopStart 
        Duplicate                              
        JumpFalse    -arrayDefaultValueexpressionList11-5-loopEnd 
        PushI        1                         
        Subtract                               
        Duplicate                              
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        PushD        arrayAddressLabelexpressionList10 
        LoadI                                  
        Add                                    
        PushI        0                         
        StoreI                                 
        Jump         -arrayDefaultValueexpressionList11-5-loopStart 
        Label        -arrayDefaultValueexpressionList11-5-loopEnd 
        Pop                                    
        Duplicate                              
        PushI        16                        
        Add                                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        StoreI                                 
        Duplicate                              
        PushI        20                        
        Add                                    
        PushI        16                        
        DLabel       arrayLengthexpressionList6 
        DataZ        4                         
        PushI        3                         
        PushI        12                        
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushD        arrayLengthexpressionList6 
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        DLabel       arrayAddressLabelexpressionList7 
        DataZ        4                         
        Duplicate                              
        PushD        arrayAddressLabelexpressionList7 
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        0                         
        Add                                    
        PushI        5                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        PushD        arrayLengthexpressionList6 
        LoadI                                  
        StoreI                                 
        PushD        arrayLengthexpressionList6 
        LoadI                                  
        Label        -arrayDefaultValueexpressionList8-4-loopStart 
        Duplicate                              
        JumpFalse    -arrayDefaultValueexpressionList8-4-loopEnd 
        PushI        1                         
        Subtract                               
        Duplicate                              
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        PushD        arrayAddressLabelexpressionList7 
        LoadI                                  
        Add                                    
        PushI        0                         
        StoreI                                 
        Jump         -arrayDefaultValueexpressionList8-4-loopStart 
        Label        -arrayDefaultValueexpressionList8-4-loopEnd 
        Pop                                    
        PushI        12                        
        PushI        0                         
        StoreI                                 
        StoreI                                 
        Nop                                    
        Exchange                               
        Pop                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% t
        LoadI                                  
        PushI        91                        
        PushD        $print-format-character   
        Printf                                 
        DLabel       printArrayAddress1        
        DataZ        4                         
        PushD        printArrayAddress1        
        Exchange                               
        StoreI                                 
        PushD        printArrayAddress1        
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushI        0                         
        Exchange                               
        Label        -arrayPrintLoop-6-arrayPrintLoopStartprintArrayAddress1 
        Duplicate                              
        JumpFalse    -arrayPrintLoop-6-arrayPrintLoopEndprintArrayAddress1 
        Exchange                               
        Duplicate                              
        JumpFalse    -arrayPrintLoop-6-arrayPrintLoopNoCommaprintArrayAddress1 
        PushI        44                        
        PushD        $print-format-character   
        Printf                                 
        PushI        32                        
        PushD        $print-format-character   
        Printf                                 
        Label        -arrayPrintLoop-6-arrayPrintLoopNoCommaprintArrayAddress1 
        Exchange                               
        PushI        1                         
        Subtract                               
        Exchange                               
        Duplicate                              
        PushI        4                         
        Multiply                               
        PushD        printArrayAddress1        
        LoadI                                  
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        PushI        91                        
        PushD        $print-format-character   
        Printf                                 
        DLabel       printArrayAddress2        
        DataZ        4                         
        PushD        printArrayAddress2        
        Exchange                               
        StoreI                                 
        PushD        printArrayAddress2        
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushI        0                         
        Exchange                               
        Label        -arrayPrintLoop-7-arrayPrintLoopStartprintArrayAddress2 
        Duplicate                              
        JumpFalse    -arrayPrintLoop-7-arrayPrintLoopEndprintArrayAddress2 
        Exchange                               
        Duplicate                              
        JumpFalse    -arrayPrintLoop-7-arrayPrintLoopNoCommaprintArrayAddress2 
        PushI        44                        
        PushD        $print-format-character   
        Printf                                 
        PushI        32                        
        PushD        $print-format-character   
        Printf                                 
        Label        -arrayPrintLoop-7-arrayPrintLoopNoCommaprintArrayAddress2 
        Exchange                               
        PushI        1                         
        Subtract                               
        Exchange                               
        Duplicate                              
        PushI        4                         
        Multiply                               
        PushD        printArrayAddress2        
        LoadI                                  
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushI        1                         
        Add                                    
        Exchange                               
        Jump         -arrayPrintLoop-7-arrayPrintLoopStartprintArrayAddress2 
        Label        -arrayPrintLoop-7-arrayPrintLoopEndprintArrayAddress2 
        Pop                                    
        Pop                                    
        PushI        93                        
        PushD        $print-format-character   
        Printf                                 
        PushI        1                         
        Add                                    
        Exchange                               
        Jump         -arrayPrintLoop-6-arrayPrintLoopStartprintArrayAddress1 
        Label        -arrayPrintLoop-6-arrayPrintLoopEndprintArrayAddress1 
        Pop                                    
        Pop                                    
        PushI        93                        
        PushD        $print-format-character   
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
