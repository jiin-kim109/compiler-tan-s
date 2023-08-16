        DLabel       $eat-location-zero        
        DataZ        8                         
        DLabel       $FP                       
        DataI        0                         
        DLabel       $SP                       
        DataI        0                         
        Memtop                                 
        PushD        $FP                       
        Exchange                               
        StoreI                                 
        Memtop                                 
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        Label        -mem-manager-initialize   
        DLabel       $heap-start-ptr           
        DataI        0                         
        DLabel       $heap-after-ptr           
        DataI        0                         
        DLabel       $heap-first-free          
        DataI        0                         
        DLabel       $mmgr-newblock-block      
        DataI        0                         
        DLabel       $mmgr-newblock-size       
        DataI        0                         
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
        Jump         $$main                    
        DLabel       $print-format-integer     
        DataC        37                        %% "%d"
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-floating    
        DataC        37                        %% "%f"
        DataC        102                       
        DataC        0                         
        DLabel       $print-format-character   
        DataC        37                        %% "%c"
        DataC        99                        
        DataC        0                         
        DLabel       $print-format-boolean     
        DataC        37                        %% "%s"
        DataC        115                       
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
        DLabel       $clear-n-return-address   
        DataI        0                         
        DLabel       $clear-num-bytes-temp     
        DataI        0                         
        Label        $$clear-n-bytes           
        PushD        $clear-n-return-address   
        Exchange                               
        StoreI                                 
        PushD        $clear-num-bytes-temp     
        Exchange                               
        StoreI                                 
        PushD        $clear-base-addr-temp     
        Exchange                               
        StoreI                                 
        PushI        0                         
        Label        $clear-n-bytes-loop       
        Duplicate                              
        PushD        $clear-num-bytes-temp     
        LoadI                                  
        Subtract                               
        JumpNeg      $clear-n-bytes-jump       
        Pop                                    
        PushD        $clear-n-return-address   
        LoadI                                  
        Return                                 
        Label        $clear-n-bytes-jump       
        Duplicate                              
        PushD        $clear-base-addr-temp     
        LoadI                                  
        Add                                    
        PushI        0                         
        StoreC                                 
        PushI        1                         
        Add                                    
        Jump         $clear-n-bytes-loop       
        DLabel       $bytecopy-n-return-address 
        DataI        0                         
        DLabel       $bytecopy-n-counter       
        DataI        0                         
        DLabel       $bytecopy-n-to-ptr        
        DataI        0                         
        DLabel       $bytecopy-n-from-ptr      
        DataI        0                         
        Label        $$bytecopy-n              
        PushD        $bytecopy-n-return-address 
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-counter       
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-to-ptr        
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        Label        $$bytecopy-n-loop         
        PushD        $bytecopy-n-counter       
        LoadI                                  
        JumpPos      $$bytecopy-n-stay-in-loop 
        Jump         $$bytecopy-n-exit         
        Label        $$bytecopy-n-stay-in-loop 
        PushI        -1                        
        PushD        $bytecopy-n-counter       
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-counter       
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        LoadC                                  
        PushD        $bytecopy-n-to-ptr        
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        1                         
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $bytecopy-n-to-ptr        
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-to-ptr        
        Exchange                               
        StoreI                                 
        Jump         $$bytecopy-n-loop         
        Label        $$bytecopy-n-exit         
        PushD        $bytecopy-n-return-address 
        LoadI                                  
        Return                                 
        Label        $$bytecopy-n-backwards    
        PushD        $bytecopy-n-return-address 
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-counter       
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-to-ptr        
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-counter       
        LoadI                                  
        PushI        1                         
        Subtract                               
        Duplicate                              
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-to-ptr        
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-to-ptr        
        Exchange                               
        StoreI                                 
        Label        $$bytecopy-n-backwards-loop 
        PushD        $bytecopy-n-counter       
        LoadI                                  
        JumpPos      $$bytecopy-n-backwards-stay-in-loop 
        Jump         $$bytecopy-n-backwards-exit 
        Label        $$bytecopy-n-backwards-stay-in-loop 
        PushI        -1                        
        PushD        $bytecopy-n-counter       
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-counter       
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        LoadC                                  
        PushD        $bytecopy-n-to-ptr        
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        $bytecopy-n-to-ptr        
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-to-ptr        
        Exchange                               
        StoreI                                 
        Jump         $$bytecopy-n-backwards-loop 
        Label        $$bytecopy-n-backwards-exit 
        PushD        $bytecopy-n-return-address 
        LoadI                                  
        Return                                 
        Label        $$bytecopy-n-reversed     
        PushD        $bytecopy-n-return-address 
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-counter       
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-to-ptr        
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-counter       
        LoadI                                  
        PushI        1                         
        Subtract                               
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        Label        $$bytecopy-n-reversed-loop 
        PushD        $bytecopy-n-counter       
        LoadI                                  
        JumpPos      $$bytecopy-n-reversed-stay-in-loop 
        Jump         $$bytecopy-n-reversed-exit 
        Label        $$bytecopy-n-reversed-stay-in-loop 
        PushI        -1                        
        PushD        $bytecopy-n-counter       
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-counter       
        Exchange                               
        StoreI                                 
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        LoadC                                  
        PushD        $bytecopy-n-to-ptr        
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $bytecopy-n-from-ptr      
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-from-ptr      
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $bytecopy-n-to-ptr        
        LoadI                                  
        Add                                    
        PushD        $bytecopy-n-to-ptr        
        Exchange                               
        StoreI                                 
        Jump         $$bytecopy-n-reversed-loop 
        Label        $$bytecopy-n-reversed-exit 
        PushD        $bytecopy-n-return-address 
        LoadI                                  
        Return                                 
        DLabel       $arraycopy-size-temp      
        DataI        0                         
        DLabel       $record-create-temp       
        DataI        0                         
        DLabel       $array-datasize-temp      
        DataI        0                         
        DLabel       $array-concat-length      
        DataI        0                         
        DLabel       $array-indexing-index     
        DataI        0                         
        DLabel       $array-indexing-index2    
        DataI        0                         
        DLabel       $array-loop-index         
        DataI        0                         
        DLabel       $errors-negative-number-given-for-array-length 
        DataC        110                       %% "negative number given for array length"
        DataC        101                       
        DataC        103                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        32                        
        DataC        110                       
        DataC        117                       
        DataC        109                       
        DataC        98                        
        DataC        101                       
        DataC        114                       
        DataC        32                        
        DataC        103                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        110                       
        DataC        32                        
        DataC        102                       
        DataC        111                       
        DataC        114                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        108                       
        DataC        101                       
        DataC        110                       
        DataC        103                       
        DataC        116                       
        DataC        104                       
        DataC        0                         
        Label        $$negative-length-array   
        PushD        $errors-negative-number-given-for-array-length 
        Jump         $$general-runtime-error   
        DLabel       $errors-array-index-out-of-bounds 
        DataC        97                        %% "array index out of bounds"
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        105                       
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
        DataC        115                       
        DataC        0                         
        Label        $$a-index-out-of-bounds   
        PushD        $errors-array-index-out-of-bounds 
        Jump         $$general-runtime-error   
        DLabel       $errors-integer-divide-by-zero 
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
        PushD        $errors-integer-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-floating-divide-by-zero 
        DataC        102                       %% "floating divide by zero"
        DataC        108                       
        DataC        111                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        110                       
        DataC        103                       
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
        PushD        $errors-floating-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-attempt-to-index-using-null-array 
        DataC        97                        %% "attempt to index using null array"
        DataC        116                       
        DataC        116                       
        DataC        101                       
        DataC        109                       
        DataC        112                       
        DataC        116                       
        DataC        32                        
        DataC        116                       
        DataC        111                       
        DataC        32                        
        DataC        105                       
        DataC        110                       
        DataC        100                       
        DataC        101                       
        DataC        120                       
        DataC        32                        
        DataC        117                       
        DataC        115                       
        DataC        105                       
        DataC        110                       
        DataC        103                       
        DataC        32                        
        DataC        110                       
        DataC        117                       
        DataC        108                       
        DataC        108                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        0                         
        Label        $$a-null-base-array       
        PushD        $errors-attempt-to-index-using-null-array 
        Jump         $$general-runtime-error   
        DLabel       $errors-attempt-to-use-released-array 
        DataC        97                        %% "attempt to use released array"
        DataC        116                       
        DataC        116                       
        DataC        101                       
        DataC        109                       
        DataC        112                       
        DataC        116                       
        DataC        32                        
        DataC        116                       
        DataC        111                       
        DataC        32                        
        DataC        117                       
        DataC        115                       
        DataC        101                       
        DataC        32                        
        DataC        114                       
        DataC        101                       
        DataC        108                       
        DataC        101                       
        DataC        97                        
        DataC        115                       
        DataC        101                       
        DataC        100                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        0                         
        Label        $$a-dangle-array          
        PushD        $errors-attempt-to-use-released-array 
        Jump         $$general-runtime-error   
        DLabel       $errors-negative-length-given-for-array 
        DataC        110                       %% "negative length given for array"
        DataC        101                       
        DataC        103                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        32                        
        DataC        108                       
        DataC        101                       
        DataC        110                       
        DataC        103                       
        DataC        116                       
        DataC        104                       
        DataC        32                        
        DataC        103                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        110                       
        DataC        32                        
        DataC        102                       
        DataC        111                       
        DataC        114                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        0                         
        Label        $$a-negative-length       
        PushD        $errors-negative-length-given-for-array 
        Jump         $$general-runtime-error   
        DLabel       $errors-function-terminated-without-a-return 
        DataC        102                       %% "function terminated without a return"
        DataC        117                       
        DataC        110                       
        DataC        99                        
        DataC        116                       
        DataC        105                       
        DataC        111                       
        DataC        110                       
        DataC        32                        
        DataC        116                       
        DataC        101                       
        DataC        114                       
        DataC        109                       
        DataC        105                       
        DataC        110                       
        DataC        97                        
        DataC        116                       
        DataC        101                       
        DataC        100                       
        DataC        32                        
        DataC        119                       
        DataC        105                       
        DataC        116                       
        DataC        104                       
        DataC        111                       
        DataC        117                       
        DataC        116                       
        DataC        32                        
        DataC        97                        
        DataC        32                        
        DataC        114                       
        DataC        101                       
        DataC        116                       
        DataC        117                       
        DataC        114                       
        DataC        110                       
        DataC        0                         
        Label        $$l-no-return-from-lambda 
        PushD        $errors-function-terminated-without-a-return 
        Jump         $$general-runtime-error   
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
        DLabel       $usable-memory-start      
        DLabel       $array-start-string       
        DataC        91                        %% "["
        DataC        0                         
        DLabel       $array-middle-string      
        DataC        44                        %% ", "
        DataC        32                        
        DataC        0                         
        DLabel       $array-end-string         
        DataC        93                        %% "]"
        DataC        0                         
        DLabel       $print-null-string        
        DataC        110                       %% "null"
        DataC        117                       
        DataC        108                       
        DataC        108                       
        DataC        0                         
        DLabel       $array-printing-index     
        DataI        0                         
        DLabel       $global-memory-block      
        DataZ        20                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% apply
        PushD        -function-1-start         
        StoreI                                 
        Jump         -function-1-bypass        
        Label        -function-1-start         
        Nop                                    %% start: store return address at SP + -8
        PushD        $SP                       
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Nop                                    %% end: store return address at SP + -8
        Nop                                    %% start: store dynamic link at SP + -4
        PushD        $FP                       
        LoadI                                  
        PushD        $SP                       
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Nop                                    %% end: store dynamic link at SP + -4
        Nop                                    %% start: FP = SP
        PushD        $SP                       
        LoadI                                  
        PushD        $FP                       
        Exchange                               
        StoreI                                 
        Nop                                    %% end: FP = SP
        Nop                                    %% start: SP -= frameSize
        PushI        -16                       
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        Nop                                    %% end: SP -= frameSize
        Label        -function-1-callHandshake-end 
        Label        -function-1-userCode-start 
        PushD        $FP                       
        LoadI                                  
        PushI        -12                       
        Add                                    %% result
        Label        -blankArray-3-start       
        Label        -arrayLength-2-args-start 
        Label        -arrayLength-2-arg1       
        PushD        $FP                       
        LoadI                                  
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Nop                                    
        Label        -arrayLength-2-start      
        Duplicate                              
        JumpFalse    -arrayLength-2-null       
        PushI        12                        
        Add                                    
        LoadI                                  
        Jump         -arrayLength-2-end        
        Label        -arrayLength-2-null       
        Pop                                    
        PushI        -1                        
        Label        -arrayLength-2-end        
        Nop                                    
        Duplicate                              
        JumpNeg      $$a-negative-length       
        Duplicate                              
        PushI        8                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temp      
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-create-temp       
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        5                         
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temp      
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-create-temp       
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        8                         
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        Label        -blankArray-3-end         
        StoreI                                 
        PushD        $FP                       
        LoadI                                  
        PushI        -16                       
        Add                                    %% i
        PushI        0                         
        StoreI                                 
        Label        -while-4-continueTarget   
        Label        -while-4-condition        
        Label        -compare-6-args-start     
        Label        -compare-6-arg1           
        PushD        $FP                       
        LoadI                                  
        PushI        -16                       
        Add                                    %% i
        LoadI                                  
        Nop                                    
        Label        -compare-6-arg2           
        Label        -arrayLength-5-args-start 
        Label        -arrayLength-5-arg1       
        PushD        $FP                       
        LoadI                                  
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Nop                                    
        Label        -arrayLength-5-start      
        Duplicate                              
        JumpFalse    -arrayLength-5-null       
        PushI        12                        
        Add                                    
        LoadI                                  
        Jump         -arrayLength-5-end        
        Label        -arrayLength-5-null       
        Pop                                    
        PushI        -1                        
        Label        -arrayLength-5-end        
        Nop                                    
        Label        -compare-6-start          
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
        JumpFalse    -while-4-end              
        Label        -while-4-body             
        Label        -arrayIndexing-7-args-start 
        Label        -arrayIndexing-7-arg1     
        PushD        $FP                       
        LoadI                                  
        PushI        -12                       
        Add                                    %% result
        LoadI                                  
        Nop                                    
        Label        -arrayIndexing-7-arg2     
        PushD        $FP                       
        LoadI                                  
        PushI        -16                       
        Add                                    %% i
        LoadI                                  
        Nop                                    
        Label        -arrayIndexing-7-start    
        PushD        $array-indexing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        Duplicate                              
        Pop                                    
        PushI        0                         
        PushD        $array-indexing-index     
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpNeg      $$a-index-out-of-bounds   
        Duplicate                              
        Duplicate                              
        Pop                                    
        PushI        0                         
        Exchange                               
        PushI        12                        
        Add                                    
        LoadI                                  
        Add                                    
        PushI        1                         
        Subtract                               
        PushD        $array-indexing-index     
        LoadI                                  
        Subtract                               
        JumpNeg      $$a-index-out-of-bounds   
        Duplicate                              
        Pop                                    
        PushI        0                         
        PushD        $array-indexing-index     
        LoadI                                  
        Exchange                               
        Subtract                               
        PushD        $array-indexing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        $array-indexing-index     
        LoadI                                  
        Multiply                               
        PushI        16                        
        Add                                    
        Add                                    
        Label        -arrayIndexing-7-end      
        Label        -pax-9-call-start         
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% pax
        LoadI                                  
        Label        -arrayIndexing-8-args-start 
        Label        -arrayIndexing-8-arg1     
        PushD        $FP                       
        LoadI                                  
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Nop                                    
        Label        -arrayIndexing-8-arg2     
        PushD        $FP                       
        LoadI                                  
        PushI        -16                       
        Add                                    %% i
        LoadI                                  
        Nop                                    
        Label        -arrayIndexing-8-start    
        PushD        $array-indexing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        Duplicate                              
        Pop                                    
        PushI        0                         
        PushD        $array-indexing-index     
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpNeg      $$a-index-out-of-bounds   
        Duplicate                              
        Duplicate                              
        Pop                                    
        PushI        0                         
        Exchange                               
        PushI        12                        
        Add                                    
        LoadI                                  
        Add                                    
        PushI        1                         
        Subtract                               
        PushD        $array-indexing-index     
        LoadI                                  
        Subtract                               
        JumpNeg      $$a-index-out-of-bounds   
        Duplicate                              
        Pop                                    
        PushI        0                         
        PushD        $array-indexing-index     
        LoadI                                  
        Exchange                               
        Subtract                               
        PushD        $array-indexing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        $array-indexing-index     
        LoadI                                  
        Multiply                               
        PushI        16                        
        Add                                    
        Add                                    
        Label        -arrayIndexing-8-end      
        LoadI                                  
        PushI        -4                        
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        PushD        $SP                       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        -1                        
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        PushD        $SP                       
        LoadI                                  
        Exchange                               
        StoreC                                 
        CallV                                  
        Label        -pax-9-call-end           
        Label        -pax-9-returnHandshake-start 
        PushD        $SP                       
        LoadI                                  
        LoadF                                  
        PushI        8                         
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        Label        -pax-9-returnHandshake-end 
        Nop                                    
        StoreF                                 
        PushD        $FP                       
        LoadI                                  
        PushI        -16                       
        Add                                    %% i
        PushD        $FP                       
        LoadI                                  
        PushI        -16                       
        Add                                    %% i
        LoadI                                  
        Nop                                    
        PushI        1                         
        Nop                                    
        Add                                    
        Nop                                    
        StoreI                                 
        Jump         -while-4-condition        
        Label        -while-4-breakTarget      
        Label        -while-4-end              
        PushD        $FP                       
        LoadI                                  
        PushI        -12                       
        Add                                    %% result
        LoadI                                  
        Jump         -function-1-returnTarget  
        Label        -function-1-userCode-end  
        Jump         $$l-no-return-from-lambda 
        Label        -function-1-returnTarget  
        PushD        $FP                       
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushD        $FP                       
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $FP                       
        LoadI                                  
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        PushD        $FP                       
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        PushD        $SP                       
        LoadI                                  
        Exchange                               
        StoreI                                 
        Return                                 
        Label        -function-1-returnHandshake-end 
        Halt                                   
        Label        -function-1-end           
        Label        -function-1-bypass        
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% pax
        PushD        -function-10-start        
        StoreI                                 
        Jump         -function-10-bypass       
        Label        -function-10-start        
        Nop                                    %% start: store return address at SP + -8
        PushD        $SP                       
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Nop                                    %% end: store return address at SP + -8
        Nop                                    %% start: store dynamic link at SP + -4
        PushD        $FP                       
        LoadI                                  
        PushD        $SP                       
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Nop                                    %% end: store dynamic link at SP + -4
        Nop                                    %% start: FP = SP
        PushD        $SP                       
        LoadI                                  
        PushD        $FP                       
        Exchange                               
        StoreI                                 
        Nop                                    %% end: FP = SP
        Nop                                    %% start: SP -= frameSize
        PushI        -8                        
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        Nop                                    %% end: SP -= frameSize
        Label        -function-10-callHandshake-end 
        Label        -function-10-userCode-start 
        Label        -if-11-condition          
        PushD        $FP                       
        LoadI                                  
        PushI        0                         
        Add                                    %% c
        LoadC                                  
        Label        -if-11-branch             
        JumpFalse    -if-11-false              
        PushF        3.140000                  
        Jump         -function-10-returnTarget 
        Jump         -if-11-end                
        Label        -if-11-false              
        Label        -if-11-end                
        Label        --12-args-start           
        Label        --12-arg1                 
        PushD        $FP                       
        LoadI                                  
        PushI        1                         
        Add                                    %% b
        LoadI                                  
        ConvertF                               
        Label        --12-arg2                 
        PushF        3.000000                  
        Nop                                    
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        Jump         -function-10-returnTarget 
        Label        -function-10-userCode-end 
        Jump         $$l-no-return-from-lambda 
        Label        -function-10-returnTarget 
        PushD        $FP                       
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushD        $FP                       
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $FP                       
        LoadI                                  
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        PushD        $FP                       
        Exchange                               
        StoreI                                 
        PushI        -3                        
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        PushD        $SP                       
        LoadI                                  
        Exchange                               
        StoreF                                 
        Return                                 
        Label        -function-10-returnHandshake-end 
        Halt                                   
        Label        -function-10-end          
        Label        -function-10-bypass       
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% max
        PushI        5                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% AA
        Label        -populatedArray-13-start  
        PushI        5                         
        Duplicate                              
        JumpNeg      $$a-negative-length       
        Duplicate                              
        PushI        4                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temp      
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-create-temp       
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        5                         
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temp      
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-create-temp       
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -populatedArray-13-startChildren 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        1                         
        Nop                                    
        Exchange                               
        PushD        $record-create-temp       
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        3                         
        Nop                                    
        Exchange                               
        PushD        $record-create-temp       
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        5                         
        Nop                                    
        Exchange                               
        PushD        $record-create-temp       
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        7                         
        Nop                                    
        Exchange                               
        PushD        $record-create-temp       
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        11                        
        Nop                                    
        Exchange                               
        PushD        $record-create-temp       
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-create-temp       
        LoadI                                  
        Label        -populatedArray-13-end    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% AA
        LoadI                                  
        Label        -arrayPrint-14-start      
        Duplicate                              
        JumpTrue     -arrayPrint-14-nonNull    
        Pop                                    
        PushD        $print-null-string        
        Printf                                 
        Jump         -arrayPrint-14-end        
        Label        -arrayPrint-14-nonNull    
        PushD        $array-start-string       
        PushD        $print-format-string      
        Printf                                 
        PushI        0                         
        PushD        $array-printing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        PushI        12                        
        Add                                    
        LoadI                                  
        JumpFalse    -arrayPrint-14-loopExit   
        Label        -arrayPrint-14-loop       
        Duplicate                              
        Duplicate                              
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        $array-printing-index     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadI                                  
        PushD        $array-printing-index     
        LoadI                                  
        Exchange                               
        PushD        $print-format-integer     
        Printf                                 
        PushD        $array-printing-index     
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $array-printing-index     
        LoadI                                  
        Add                                    
        PushD        $array-printing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $array-printing-index     
        LoadI                                  
        Subtract                               
        JumpPos      -arrayPrint-14-loopContinue 
        Jump         -arrayPrint-14-loopExit   
        Label        -arrayPrint-14-loopContinue 
        PushD        $array-middle-string      
        PushD        $print-format-string      
        Printf                                 
        Jump         -arrayPrint-14-loop       
        Label        -arrayPrint-14-loopExit   
        Pop                                    
        PushD        $array-end-string         
        PushD        $print-format-string      
        Printf                                 
        Label        -arrayPrint-14-end        
        PushI        10                        
        PushD        $print-format-character   
        Printf                                 
        Label        -apply-15-call-start      
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% apply
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% AA
        LoadI                                  
        PushI        -4                        
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        PushD        $SP                       
        LoadI                                  
        Exchange                               
        StoreI                                 
        CallV                                  
        Label        -apply-15-call-end        
        Label        -apply-15-returnHandshake-start 
        PushD        $SP                       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $SP                       
        LoadI                                  
        Add                                    
        PushD        $SP                       
        Exchange                               
        StoreI                                 
        Label        -apply-15-returnHandshake-end 
        Label        -arrayPrint-16-start      
        Duplicate                              
        JumpTrue     -arrayPrint-16-nonNull    
        Pop                                    
        PushD        $print-null-string        
        Printf                                 
        Jump         -arrayPrint-16-end        
        Label        -arrayPrint-16-nonNull    
        PushD        $array-start-string       
        PushD        $print-format-string      
        Printf                                 
        PushI        0                         
        PushD        $array-printing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        PushI        12                        
        Add                                    
        LoadI                                  
        JumpFalse    -arrayPrint-16-loopExit   
        Label        -arrayPrint-16-loop       
        Duplicate                              
        Duplicate                              
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        $array-printing-index     
        LoadI                                  
        Multiply                               
        Add                                    
        PushI        16                        
        Add                                    
        LoadF                                  
        PushD        $array-printing-index     
        LoadI                                  
        Exchange                               
        PushD        $print-format-floating    
        Printf                                 
        PushD        $array-printing-index     
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $array-printing-index     
        LoadI                                  
        Add                                    
        PushD        $array-printing-index     
        Exchange                               
        StoreI                                 
        Duplicate                              
        Duplicate                              
        JumpFalse    $$a-null-base-array       
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushI        5                         
        Subtract                               
        BNegate                                
        JumpFalse    $$a-dangle-array          
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $array-printing-index     
        LoadI                                  
        Subtract                               
        JumpPos      -arrayPrint-16-loopContinue 
        Jump         -arrayPrint-16-loopExit   
        Label        -arrayPrint-16-loopContinue 
        PushD        $array-middle-string      
        PushD        $print-format-string      
        Printf                                 
        Jump         -arrayPrint-16-loop       
        Label        -arrayPrint-16-loopExit   
        Pop                                    
        PushD        $array-end-string         
        PushD        $print-format-string      
        Printf                                 
        Label        -arrayPrint-16-end        
        PushI        10                        
        PushD        $print-format-character   
        Printf                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% count
        PushI        0                         
        StoreI                                 
        PushI        10                        
        PushD        $print-format-character   
        Printf                                 
        DLabel       -stringConstant-17--start 
        DataI        3                         type id for string
        DataI        9                         status for string
        DataI        9                         length
        DataC        97                        %% "all done."
        DataC        108                       
        DataC        108                       
        DataC        32                        
        DataC        100                       
        DataC        111                       
        DataC        110                       
        DataC        101                       
        DataC        46                        
        DataC        0                         
        PushD        -stringConstant-17--start 
        PushI        12                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        PushI        10                        
        PushD        $print-format-character   
        Printf                                 
        Halt                                   
        Halt                                   
        Label        -mem-manager-make-tags    
        DLabel       $mmgr-tags-size           
        DataI        0                         
        DLabel       $mmgr-tags-start          
        DataI        0                         
        DLabel       $mmgr-tags-available      
        DataI        0                         
        DLabel       $mmgr-tags-nextptr        
        DataI        0                         
        DLabel       $mmgr-tags-prevptr        
        DataI        0                         
        DLabel       $mmgr-tags-return         
        DataI        0                         
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
        DataI        0                         
        DLabel       $mmgr-onetag-location     
        DataI        0                         
        DLabel       $mmgr-onetag-available    
        DataI        0                         
        DLabel       $mmgr-onetag-size         
        DataI        0                         
        DLabel       $mmgr-onetag-pointer      
        DataI        0                         
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
        DataI        0                         
        DLabel       $mmgr-alloc-size          
        DataI        0                         
        DLabel       $mmgr-alloc-current-block 
        DataI        0                         
        DLabel       $mmgr-alloc-remainder-block 
        DataI        0                         
        DLabel       $mmgr-alloc-remainder-size 
        DataI        0                         
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
        DataI        0                         
        DLabel       $mmgr-dealloc-block       
        DataI        0                         
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
        DataI        0                         
        DLabel       $mmgr-remove-block        
        DataI        0                         
        DLabel       $mmgr-remove-prev         
        DataI        0                         
        DLabel       $mmgr-remove-next         
        DataI        0                         
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
