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
        DataZ        24                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% size
        PushI        5000                      
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% printEvery
        PushI        50                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        PushI        16                        
        DLabel       arrayLengthexpressionList0 
        DataZ        4                         
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% size
        PushI        12                        
        PushI        0                         
        StoreI                                 
        LoadI                                  
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
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        PushI        0                         
        StoreI                                 
        Label        loop0-start               
        Label        -while-loop-5-condition   
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% size
        LoadI                                  
        Nop                                    
        Subtract                               
        JumpNeg      -compare-2-true           
        Jump         -compare-2-false          
        Label        -compare-2-true           
        PushI        1                         
        Jump         -compare-2-join           
        Label        -compare-2-false          
        PushI        0                         
        Jump         -compare-2-join           
        Label        -compare-2-join           
        JumpFalse    -while-loop-5-exit        
        DLabel       arrayIndexarrayIndex0     
        DataZ        4                         
        PushD        arrayIndexarrayIndex0     
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex0     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex0     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        PushI        16                        
        DLabel       arrayLengthexpressionList3 
        DataZ        4                         
        PushI        7                         
        PushI        12                        
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushD        arrayLengthexpressionList3 
        Exchange                               
        StoreI                                 
        PushI        8                         
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
        PushI        8                         
        StoreI                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        PushD        arrayLengthexpressionList3 
        LoadI                                  
        StoreI                                 
        PushD        arrayLengthexpressionList3 
        LoadI                                  
        Label        -arrayDefaultValueexpressionList5-3-loopStart 
        Duplicate                              
        JumpFalse    -arrayDefaultValueexpressionList5-3-loopEnd 
        PushI        1                         
        Subtract                               
        Duplicate                              
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        PushD        arrayAddressLabelexpressionList4 
        LoadI                                  
        Add                                    
        PushI        0                         
        StoreI                                 
        Jump         -arrayDefaultValueexpressionList5-3-loopStart 
        Label        -arrayDefaultValueexpressionList5-3-loopEnd 
        Pop                                    
        Nop                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        Label        -Operator-4-args          
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        PushI        1                         
        Nop                                    
        Add                                    
        Nop                                    
        StoreI                                 
        Jump         -while-loop-5-condition   
        Label        -while-loop-5-exit        
        Label        loop0-end                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        PushI        0                         
        Nop                                    
        StoreI                                 
        Label        loop1-start               
        Label        -while-loop-15-condition  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% size
        LoadI                                  
        Nop                                    
        Subtract                               
        JumpNeg      -compare-6-true           
        Jump         -compare-6-false          
        Label        -compare-6-true           
        PushI        1                         
        Jump         -compare-6-join           
        Label        -compare-6-false          
        PushI        0                         
        Jump         -compare-6-join           
        Label        -compare-6-join           
        JumpFalse    -while-loop-15-exit       
        DLabel       arrayIndexarrayIndex2     
        DataZ        4                         
        PushD        arrayIndexarrayIndex2     
        PushI        0                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex1     
        DataZ        4                         
        PushD        arrayIndexarrayIndex1     
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex1     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex1     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex2     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex2     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        Label        -Operator-7-args          
        PushF        0.010000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        StoreF                                 
        DLabel       arrayIndexarrayIndex4     
        DataZ        4                         
        PushD        arrayIndexarrayIndex4     
        PushI        1                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex3     
        DataZ        4                         
        PushD        arrayIndexarrayIndex3     
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex3     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex3     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex4     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex4     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        Label        -Operator-8-args          
        PushF        0.200000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        StoreF                                 
        DLabel       arrayIndexarrayIndex6     
        DataZ        4                         
        PushD        arrayIndexarrayIndex6     
        PushI        2                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex5     
        DataZ        4                         
        PushD        arrayIndexarrayIndex5     
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex5     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex5     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex6     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex6     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        Label        -Operator-9-args          
        PushF        3.000000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        StoreF                                 
        DLabel       arrayIndexarrayIndex8     
        DataZ        4                         
        PushD        arrayIndexarrayIndex8     
        PushI        3                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex7     
        DataZ        4                         
        PushD        arrayIndexarrayIndex7     
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex7     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex7     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex8     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex8     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        Label        -Operator-10-args         
        PushF        40.000000                 
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        StoreF                                 
        DLabel       arrayIndexarrayIndex10    
        DataZ        4                         
        PushD        arrayIndexarrayIndex10    
        PushI        4                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex9     
        DataZ        4                         
        PushD        arrayIndexarrayIndex9     
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex9     
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex9     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex10    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex10    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        Label        -Operator-11-args         
        PushF        500.000000                
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        StoreF                                 
        DLabel       arrayIndexarrayIndex12    
        DataZ        4                         
        PushD        arrayIndexarrayIndex12    
        PushI        5                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex11    
        DataZ        4                         
        PushD        arrayIndexarrayIndex11    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex11    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex11    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex12    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex12    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        Label        -Operator-12-args         
        PushF        6000.000000               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        StoreF                                 
        DLabel       arrayIndexarrayIndex14    
        DataZ        4                         
        PushD        arrayIndexarrayIndex14    
        PushI        6                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex13    
        DataZ        4                         
        PushD        arrayIndexarrayIndex13    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex13    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex13    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex14    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex14    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        Label        -Operator-13-args         
        PushF        70000.000000              
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        StoreF                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        Label        -Operator-14-args         
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        PushI        1                         
        Nop                                    
        Add                                    
        Nop                                    
        StoreI                                 
        Jump         -while-loop-15-condition  
        Label        -while-loop-15-exit       
        Label        loop1-end                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        PushI        0                         
        Nop                                    
        StoreI                                 
        Label        loop2-start               
        Label        -while-loop-44-condition  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% size
        LoadI                                  
        Nop                                    
        Subtract                               
        JumpNeg      -compare-16-true          
        Jump         -compare-16-false         
        Label        -compare-16-true          
        PushI        1                         
        Jump         -compare-16-join          
        Label        -compare-16-false         
        PushI        0                         
        Jump         -compare-16-join          
        Label        -compare-16-join          
        JumpFalse    -while-loop-44-exit       
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% elem1
        Label        -Operator-17-args         
        PushF        0.010000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        DLabel       arrayIndexarrayIndex16    
        DataZ        4                         
        PushD        arrayIndexarrayIndex16    
        PushI        0                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex15    
        DataZ        4                         
        PushD        arrayIndexarrayIndex15    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex15    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex15    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex16    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex16    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        Nop                                    
        FSubtract                              
        JumpFZero    -compare-18-true          
        Jump         -compare-18-false         
        Label        -compare-18-true          
        PushI        1                         
        Jump         -compare-18-join          
        Label        -compare-18-false         
        PushI        0                         
        Jump         -compare-18-join          
        Label        -compare-18-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% elem2
        Label        -Operator-19-args         
        PushF        0.200000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        DLabel       arrayIndexarrayIndex18    
        DataZ        4                         
        PushD        arrayIndexarrayIndex18    
        PushI        1                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex17    
        DataZ        4                         
        PushD        arrayIndexarrayIndex17    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex17    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex17    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex18    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex18    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        Nop                                    
        FSubtract                              
        JumpFZero    -compare-20-true          
        Jump         -compare-20-false         
        Label        -compare-20-true          
        PushI        1                         
        Jump         -compare-20-join          
        Label        -compare-20-false         
        PushI        0                         
        Jump         -compare-20-join          
        Label        -compare-20-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        18                        
        Add                                    %% elem3
        Label        -Operator-21-args         
        PushF        3.000000                  
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        DLabel       arrayIndexarrayIndex20    
        DataZ        4                         
        PushD        arrayIndexarrayIndex20    
        PushI        2                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex19    
        DataZ        4                         
        PushD        arrayIndexarrayIndex19    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex19    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex19    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex20    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex20    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        Nop                                    
        FSubtract                              
        JumpFZero    -compare-22-true          
        Jump         -compare-22-false         
        Label        -compare-22-true          
        PushI        1                         
        Jump         -compare-22-join          
        Label        -compare-22-false         
        PushI        0                         
        Jump         -compare-22-join          
        Label        -compare-22-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        19                        
        Add                                    %% elem4
        Label        -Operator-23-args         
        PushF        40.000000                 
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        DLabel       arrayIndexarrayIndex22    
        DataZ        4                         
        PushD        arrayIndexarrayIndex22    
        PushI        3                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex21    
        DataZ        4                         
        PushD        arrayIndexarrayIndex21    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex21    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex21    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex22    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex22    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        Nop                                    
        FSubtract                              
        JumpFZero    -compare-24-true          
        Jump         -compare-24-false         
        Label        -compare-24-true          
        PushI        1                         
        Jump         -compare-24-join          
        Label        -compare-24-false         
        PushI        0                         
        Jump         -compare-24-join          
        Label        -compare-24-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% elem5
        Label        -Operator-25-args         
        PushF        500.000000                
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        DLabel       arrayIndexarrayIndex24    
        DataZ        4                         
        PushD        arrayIndexarrayIndex24    
        PushI        4                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex23    
        DataZ        4                         
        PushD        arrayIndexarrayIndex23    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex23    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex23    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex24    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex24    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        Nop                                    
        FSubtract                              
        JumpFZero    -compare-26-true          
        Jump         -compare-26-false         
        Label        -compare-26-true          
        PushI        1                         
        Jump         -compare-26-join          
        Label        -compare-26-false         
        PushI        0                         
        Jump         -compare-26-join          
        Label        -compare-26-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        21                        
        Add                                    %% elem6
        Label        -Operator-27-args         
        PushF        6000.000000               
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        DLabel       arrayIndexarrayIndex26    
        DataZ        4                         
        PushD        arrayIndexarrayIndex26    
        PushI        5                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex25    
        DataZ        4                         
        PushD        arrayIndexarrayIndex25    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex25    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex25    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex26    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex26    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        Nop                                    
        FSubtract                              
        JumpFZero    -compare-28-true          
        Jump         -compare-28-false         
        Label        -compare-28-true          
        PushI        1                         
        Jump         -compare-28-join          
        Label        -compare-28-false         
        PushI        0                         
        Jump         -compare-28-join          
        Label        -compare-28-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% elem7
        Label        -Operator-29-args         
        PushF        70000.000000              
        Nop                                    
        PushI        0                         
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Exchange                               
        Pop                                    
        ConvertF                               
        Nop                                    
        FAdd                                   
        Nop                                    
        DLabel       arrayIndexarrayIndex28    
        DataZ        4                         
        PushD        arrayIndexarrayIndex28    
        PushI        6                         
        StoreI                                 
        DLabel       arrayIndexarrayIndex27    
        DataZ        4                         
        PushD        arrayIndexarrayIndex27    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arrays
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex27    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex27    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex28    
        LoadI                                  
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        Subtract                               
        Duplicate                              
        JumpNeg      $$index-out-of-bound      
        JumpFalse    $$index-out-of-bound      
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        arrayIndexarrayIndex28    
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        Nop                                    
        FSubtract                              
        JumpFZero    -compare-30-true          
        Jump         -compare-30-false         
        Label        -compare-30-true          
        PushI        1                         
        Jump         -compare-30-join          
        Label        -compare-30-false         
        PushI        0                         
        Jump         -compare-30-join          
        Label        -compare-30-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        23                        
        Add                                    %% good
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% elem1
        LoadC                                  
        Nop                                    
        JumpFalse    -and-36-false             
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% elem2
        LoadC                                  
        Nop                                    
        JumpFalse    -and-35-false             
        PushD        $global-memory-block      
        PushI        18                        
        Add                                    %% elem3
        LoadC                                  
        Nop                                    
        JumpFalse    -and-34-false             
        PushD        $global-memory-block      
        PushI        19                        
        Add                                    %% elem4
        LoadC                                  
        Nop                                    
        JumpFalse    -and-33-false             
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% elem5
        LoadC                                  
        Nop                                    
        JumpFalse    -and-32-false             
        PushD        $global-memory-block      
        PushI        21                        
        Add                                    %% elem6
        LoadC                                  
        Nop                                    
        JumpFalse    -and-31-false             
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% elem7
        LoadC                                  
        Nop                                    
        JumpFalse    -and-31-false             
        Jump         -and-31-true              
        Label        -and-31-false             
        PushI        0                         
        Jump         -and-31-join              
        Label        -and-31-true              
        PushI        1                         
        Label        -and-31-join              
        Nop                                    
        JumpFalse    -and-32-false             
        Jump         -and-32-true              
        Label        -and-32-false             
        PushI        0                         
        Jump         -and-32-join              
        Label        -and-32-true              
        PushI        1                         
        Label        -and-32-join              
        Nop                                    
        JumpFalse    -and-33-false             
        Jump         -and-33-true              
        Label        -and-33-false             
        PushI        0                         
        Jump         -and-33-join              
        Label        -and-33-true              
        PushI        1                         
        Label        -and-33-join              
        Nop                                    
        JumpFalse    -and-34-false             
        Jump         -and-34-true              
        Label        -and-34-false             
        PushI        0                         
        Jump         -and-34-join              
        Label        -and-34-true              
        PushI        1                         
        Label        -and-34-join              
        Nop                                    
        JumpFalse    -and-35-false             
        Jump         -and-35-true              
        Label        -and-35-false             
        PushI        0                         
        Jump         -and-35-join              
        Label        -and-35-true              
        PushI        1                         
        Label        -and-35-join              
        Nop                                    
        JumpFalse    -and-36-false             
        Jump         -and-36-true              
        Label        -and-36-false             
        PushI        0                         
        Jump         -and-36-join              
        Label        -and-36-true              
        PushI        1                         
        Label        -and-36-join              
        StoreC                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        Label        -Operator-37-args         
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% printEvery
        LoadI                                  
        Nop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% printEvery
        LoadI                                  
        Nop                                    
        Duplicate                              
        JumpFalse    $$i-divide-by-zero        
        Divide                                 
        Nop                                    
        Multiply                               
        Nop                                    
        Subtract                               
        JumpFalse    -compare-38-true          
        Jump         -compare-38-false         
        Label        -compare-38-true          
        PushI        1                         
        Jump         -compare-38-join          
        Label        -compare-38-false         
        PushI        0                         
        Jump         -compare-38-join          
        Label        -compare-38-join          
        JumpFalse    -if-condition-40-false    
        Label        -if-condition-40-true     
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        23                        
        Add                                    %% good
        LoadC                                  
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
        Label        -if-condition-40-false    
        PushD        $global-memory-block      
        PushI        23                        
        Add                                    %% good
        LoadC                                  
        Nop                                    
        Duplicate                              
        JumpFalse    -not-41-false             
        PushI        -1                        
        Add                                    
        Jump         -not-41-join              
        Label        -not-41-false             
        PushI        1                         
        Add                                    
        Jump         -not-41-join              
        Label        -not-41-join              
        JumpFalse    -if-condition-42-false    
        Label        -if-condition-42-true     
        DLabel       string0                   
        DataI        3                         
        DataI        9                         
        DataI        5                         
        DataC        98                        
        DataC        97                        
        DataC        100                       
        DataC        33                        
        DataC        32                        
        DataC        0                         
        PushD        string0                   
        PushI        12                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -if-condition-42-false    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        Label        -Operator-43-args         
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% indx
        LoadI                                  
        Nop                                    
        PushI        1                         
        Nop                                    
        Add                                    
        Nop                                    
        StoreI                                 
        Jump         -while-loop-44-condition  
        Label        -while-loop-44-exit       
        Label        loop2-end                 
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
