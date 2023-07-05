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
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-1-false          
        Jump         -compare-1-true           
        Label        -compare-1-true           
        PushI        1                         
        Jump         -compare-1-join           
        Label        -compare-1-false          
        PushI        0                         
        Jump         -compare-1-join           
        Label        -compare-1-join           
        Nop                                    
        Subtract                               
        JumpFalse    -compare-2-false          
        Jump         -compare-2-true           
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-4-false          
        Jump         -compare-4-true           
        Label        -compare-4-true           
        PushI        1                         
        Jump         -compare-4-join           
        Label        -compare-4-false          
        PushI        0                         
        Jump         -compare-4-join           
        Label        -compare-4-join           
        Nop                                    
        Subtract                               
        JumpFalse    -compare-5-false          
        Jump         -compare-5-true           
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-7-false          
        Jump         -compare-7-true           
        Label        -compare-7-true           
        PushI        1                         
        Jump         -compare-7-join           
        Label        -compare-7-false          
        PushI        0                         
        Jump         -compare-7-join           
        Label        -compare-7-join           
        Nop                                    
        Subtract                               
        JumpFalse    -compare-8-false          
        Jump         -compare-8-true           
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
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-10-false         
        Jump         -compare-10-true          
        Label        -compare-10-true          
        PushI        1                         
        Jump         -compare-10-join          
        Label        -compare-10-false         
        PushI        0                         
        Jump         -compare-10-join          
        Label        -compare-10-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-11-false         
        Jump         -compare-11-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-13-false         
        Jump         -compare-13-true          
        Label        -compare-13-true          
        PushI        1                         
        Jump         -compare-13-join          
        Label        -compare-13-false         
        PushI        0                         
        Jump         -compare-13-join          
        Label        -compare-13-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-14-false         
        Jump         -compare-14-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-16-false         
        Jump         -compare-16-true          
        Label        -compare-16-true          
        PushI        1                         
        Jump         -compare-16-join          
        Label        -compare-16-false         
        PushI        0                         
        Jump         -compare-16-join          
        Label        -compare-16-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-17-false         
        Jump         -compare-17-true          
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
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-19-false         
        Jump         -compare-19-true          
        Label        -compare-19-true          
        PushI        1                         
        Jump         -compare-19-join          
        Label        -compare-19-false         
        PushI        0                         
        Jump         -compare-19-join          
        Label        -compare-19-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-20-false         
        Jump         -compare-20-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-22-false         
        Jump         -compare-22-true          
        Label        -compare-22-true          
        PushI        1                         
        Jump         -compare-22-join          
        Label        -compare-22-false         
        PushI        0                         
        Jump         -compare-22-join          
        Label        -compare-22-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-23-false         
        Jump         -compare-23-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-25-false         
        Jump         -compare-25-true          
        Label        -compare-25-true          
        PushI        1                         
        Jump         -compare-25-join          
        Label        -compare-25-false         
        PushI        0                         
        Jump         -compare-25-join          
        Label        -compare-25-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-26-false         
        Jump         -compare-26-true          
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
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-28-false         
        Jump         -compare-28-true          
        Label        -compare-28-true          
        PushI        1                         
        Jump         -compare-28-join          
        Label        -compare-28-false         
        PushI        0                         
        Jump         -compare-28-join          
        Label        -compare-28-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-29-false         
        Jump         -compare-29-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-31-false         
        Jump         -compare-31-true          
        Label        -compare-31-true          
        PushI        1                         
        Jump         -compare-31-join          
        Label        -compare-31-false         
        PushI        0                         
        Jump         -compare-31-join          
        Label        -compare-31-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-32-false         
        Jump         -compare-32-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-34-false         
        Jump         -compare-34-true          
        Label        -compare-34-true          
        PushI        1                         
        Jump         -compare-34-join          
        Label        -compare-34-false         
        PushI        0                         
        Jump         -compare-34-join          
        Label        -compare-34-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-35-false         
        Jump         -compare-35-true          
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
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-37-false         
        Jump         -compare-37-true          
        Label        -compare-37-true          
        PushI        1                         
        Jump         -compare-37-join          
        Label        -compare-37-false         
        PushI        0                         
        Jump         -compare-37-join          
        Label        -compare-37-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-38-false         
        Jump         -compare-38-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-40-false         
        Jump         -compare-40-true          
        Label        -compare-40-true          
        PushI        1                         
        Jump         -compare-40-join          
        Label        -compare-40-false         
        PushI        0                         
        Jump         -compare-40-join          
        Label        -compare-40-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-41-false         
        Jump         -compare-41-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-43-false         
        Jump         -compare-43-true          
        Label        -compare-43-true          
        PushI        1                         
        Jump         -compare-43-join          
        Label        -compare-43-false         
        PushI        0                         
        Jump         -compare-43-join          
        Label        -compare-43-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-44-false         
        Jump         -compare-44-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-46-false         
        Jump         -compare-46-true          
        Label        -compare-46-true          
        PushI        1                         
        Jump         -compare-46-join          
        Label        -compare-46-false         
        PushI        0                         
        Jump         -compare-46-join          
        Label        -compare-46-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-47-false         
        Jump         -compare-47-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-49-false         
        Jump         -compare-49-true          
        Label        -compare-49-true          
        PushI        1                         
        Jump         -compare-49-join          
        Label        -compare-49-false         
        PushI        0                         
        Jump         -compare-49-join          
        Label        -compare-49-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-50-false         
        Jump         -compare-50-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-52-false         
        Jump         -compare-52-true          
        Label        -compare-52-true          
        PushI        1                         
        Jump         -compare-52-join          
        Label        -compare-52-false         
        PushI        0                         
        Jump         -compare-52-join          
        Label        -compare-52-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-53-false         
        Jump         -compare-53-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-55-false         
        Jump         -compare-55-true          
        Label        -compare-55-true          
        PushI        1                         
        Jump         -compare-55-join          
        Label        -compare-55-false         
        PushI        0                         
        Jump         -compare-55-join          
        Label        -compare-55-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-56-false         
        Jump         -compare-56-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-58-false         
        Jump         -compare-58-true          
        Label        -compare-58-true          
        PushI        1                         
        Jump         -compare-58-join          
        Label        -compare-58-false         
        PushI        0                         
        Jump         -compare-58-join          
        Label        -compare-58-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-59-false         
        Jump         -compare-59-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-61-false         
        Jump         -compare-61-true          
        Label        -compare-61-true          
        PushI        1                         
        Jump         -compare-61-join          
        Label        -compare-61-false         
        PushI        0                         
        Jump         -compare-61-join          
        Label        -compare-61-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-62-false         
        Jump         -compare-62-true          
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
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-64-false         
        Jump         -compare-64-true          
        Label        -compare-64-true          
        PushI        1                         
        Jump         -compare-64-join          
        Label        -compare-64-false         
        PushI        0                         
        Jump         -compare-64-join          
        Label        -compare-64-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-65-false         
        Jump         -compare-65-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-67-false         
        Jump         -compare-67-true          
        Label        -compare-67-true          
        PushI        1                         
        Jump         -compare-67-join          
        Label        -compare-67-false         
        PushI        0                         
        Jump         -compare-67-join          
        Label        -compare-67-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-68-false         
        Jump         -compare-68-true          
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
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-70-false         
        Jump         -compare-70-true          
        Label        -compare-70-true          
        PushI        1                         
        Jump         -compare-70-join          
        Label        -compare-70-false         
        PushI        0                         
        Jump         -compare-70-join          
        Label        -compare-70-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-71-false         
        Jump         -compare-71-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-73-false         
        Jump         -compare-73-true          
        Label        -compare-73-true          
        PushI        1                         
        Jump         -compare-73-join          
        Label        -compare-73-false         
        PushI        0                         
        Jump         -compare-73-join          
        Label        -compare-73-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-74-false         
        Jump         -compare-74-true          
        Label        -compare-74-true          
        PushI        1                         
        Jump         -compare-74-join          
        Label        -compare-74-false         
        PushI        0                         
        Jump         -compare-74-join          
        Label        -compare-74-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-75-false         
        Jump         -compare-75-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-77-false         
        Jump         -compare-77-true          
        Label        -compare-77-true          
        PushI        1                         
        Jump         -compare-77-join          
        Label        -compare-77-false         
        PushI        0                         
        Jump         -compare-77-join          
        Label        -compare-77-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-78-false         
        Jump         -compare-78-true          
        Label        -compare-78-true          
        PushI        1                         
        Jump         -compare-78-join          
        Label        -compare-78-false         
        PushI        0                         
        Jump         -compare-78-join          
        Label        -compare-78-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-79-false         
        Jump         -compare-79-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-81-false         
        Jump         -compare-81-true          
        Label        -compare-81-true          
        PushI        1                         
        Jump         -compare-81-join          
        Label        -compare-81-false         
        PushI        0                         
        Jump         -compare-81-join          
        Label        -compare-81-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-82-false         
        Jump         -compare-82-true          
        Label        -compare-82-true          
        PushI        1                         
        Jump         -compare-82-join          
        Label        -compare-82-false         
        PushI        0                         
        Jump         -compare-82-join          
        Label        -compare-82-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-83-false         
        Jump         -compare-83-true          
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
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-85-false         
        Jump         -compare-85-true          
        Label        -compare-85-true          
        PushI        1                         
        Jump         -compare-85-join          
        Label        -compare-85-false         
        PushI        0                         
        Jump         -compare-85-join          
        Label        -compare-85-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-86-false         
        Jump         -compare-86-true          
        Label        -compare-86-true          
        PushI        1                         
        Jump         -compare-86-join          
        Label        -compare-86-false         
        PushI        0                         
        Jump         -compare-86-join          
        Label        -compare-86-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-87-false         
        Jump         -compare-87-true          
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
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-89-false         
        Jump         -compare-89-true          
        Label        -compare-89-true          
        PushI        1                         
        Jump         -compare-89-join          
        Label        -compare-89-false         
        PushI        0                         
        Jump         -compare-89-join          
        Label        -compare-89-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-90-false         
        Jump         -compare-90-true          
        Label        -compare-90-true          
        PushI        1                         
        Jump         -compare-90-join          
        Label        -compare-90-false         
        PushI        0                         
        Jump         -compare-90-join          
        Label        -compare-90-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-91-false         
        Jump         -compare-91-true          
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
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-93-false         
        Jump         -compare-93-true          
        Label        -compare-93-true          
        PushI        1                         
        Jump         -compare-93-join          
        Label        -compare-93-false         
        PushI        0                         
        Jump         -compare-93-join          
        Label        -compare-93-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-94-false         
        Jump         -compare-94-true          
        Label        -compare-94-true          
        PushI        1                         
        Jump         -compare-94-join          
        Label        -compare-94-false         
        PushI        0                         
        Jump         -compare-94-join          
        Label        -compare-94-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-95-false         
        Jump         -compare-95-true          
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-97-false         
        Jump         -compare-97-true          
        Label        -compare-97-true          
        PushI        1                         
        Jump         -compare-97-join          
        Label        -compare-97-false         
        PushI        0                         
        Jump         -compare-97-join          
        Label        -compare-97-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-98-false         
        Jump         -compare-98-true          
        Label        -compare-98-true          
        PushI        1                         
        Jump         -compare-98-join          
        Label        -compare-98-false         
        PushI        0                         
        Jump         -compare-98-join          
        Label        -compare-98-join          
        Nop                                    
        Subtract                               
        JumpFalse    -compare-99-false         
        Jump         -compare-99-true          
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-101-false        
        Jump         -compare-101-true         
        Label        -compare-101-true         
        PushI        1                         
        Jump         -compare-101-join         
        Label        -compare-101-false        
        PushI        0                         
        Jump         -compare-101-join         
        Label        -compare-101-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-102-false        
        Jump         -compare-102-true         
        Label        -compare-102-true         
        PushI        1                         
        Jump         -compare-102-join         
        Label        -compare-102-false        
        PushI        0                         
        Jump         -compare-102-join         
        Label        -compare-102-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-103-false        
        Jump         -compare-103-true         
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
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-105-false        
        Jump         -compare-105-true         
        Label        -compare-105-true         
        PushI        1                         
        Jump         -compare-105-join         
        Label        -compare-105-false        
        PushI        0                         
        Jump         -compare-105-join         
        Label        -compare-105-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-106-false        
        Jump         -compare-106-true         
        Label        -compare-106-true         
        PushI        1                         
        Jump         -compare-106-join         
        Label        -compare-106-false        
        PushI        0                         
        Jump         -compare-106-join         
        Label        -compare-106-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-107-false        
        Jump         -compare-107-true         
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-109-false        
        Jump         -compare-109-true         
        Label        -compare-109-true         
        PushI        1                         
        Jump         -compare-109-join         
        Label        -compare-109-false        
        PushI        0                         
        Jump         -compare-109-join         
        Label        -compare-109-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-110-false        
        Jump         -compare-110-true         
        Label        -compare-110-true         
        PushI        1                         
        Jump         -compare-110-join         
        Label        -compare-110-false        
        PushI        0                         
        Jump         -compare-110-join         
        Label        -compare-110-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-111-false        
        Jump         -compare-111-true         
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-113-false        
        Jump         -compare-113-true         
        Label        -compare-113-true         
        PushI        1                         
        Jump         -compare-113-join         
        Label        -compare-113-false        
        PushI        0                         
        Jump         -compare-113-join         
        Label        -compare-113-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-114-false        
        Jump         -compare-114-true         
        Label        -compare-114-true         
        PushI        1                         
        Jump         -compare-114-join         
        Label        -compare-114-false        
        PushI        0                         
        Jump         -compare-114-join         
        Label        -compare-114-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-115-false        
        Jump         -compare-115-true         
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
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-117-false        
        Jump         -compare-117-true         
        Label        -compare-117-true         
        PushI        1                         
        Jump         -compare-117-join         
        Label        -compare-117-false        
        PushI        0                         
        Jump         -compare-117-join         
        Label        -compare-117-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-118-false        
        Jump         -compare-118-true         
        Label        -compare-118-true         
        PushI        1                         
        Jump         -compare-118-join         
        Label        -compare-118-false        
        PushI        0                         
        Jump         -compare-118-join         
        Label        -compare-118-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-119-false        
        Jump         -compare-119-true         
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
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-121-false        
        Jump         -compare-121-true         
        Label        -compare-121-true         
        PushI        1                         
        Jump         -compare-121-join         
        Label        -compare-121-false        
        PushI        0                         
        Jump         -compare-121-join         
        Label        -compare-121-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-122-false        
        Jump         -compare-122-true         
        Label        -compare-122-true         
        PushI        1                         
        Jump         -compare-122-join         
        Label        -compare-122-false        
        PushI        0                         
        Jump         -compare-122-join         
        Label        -compare-122-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-123-false        
        Jump         -compare-123-true         
        Label        -compare-123-true         
        PushI        1                         
        Jump         -compare-123-join         
        Label        -compare-123-false        
        PushI        0                         
        Jump         -compare-123-join         
        Label        -compare-123-join         
        JumpTrue     -print-boolean-124-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-124-join   
        Label        -print-boolean-124-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-124-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-125-false        
        Jump         -compare-125-true         
        Label        -compare-125-true         
        PushI        1                         
        Jump         -compare-125-join         
        Label        -compare-125-false        
        PushI        0                         
        Jump         -compare-125-join         
        Label        -compare-125-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-126-false        
        Jump         -compare-126-true         
        Label        -compare-126-true         
        PushI        1                         
        Jump         -compare-126-join         
        Label        -compare-126-false        
        PushI        0                         
        Jump         -compare-126-join         
        Label        -compare-126-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-127-false        
        Jump         -compare-127-true         
        Label        -compare-127-true         
        PushI        1                         
        Jump         -compare-127-join         
        Label        -compare-127-false        
        PushI        0                         
        Jump         -compare-127-join         
        Label        -compare-127-join         
        JumpTrue     -print-boolean-128-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-128-join   
        Label        -print-boolean-128-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-128-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-129-false        
        Jump         -compare-129-true         
        Label        -compare-129-true         
        PushI        1                         
        Jump         -compare-129-join         
        Label        -compare-129-false        
        PushI        0                         
        Jump         -compare-129-join         
        Label        -compare-129-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-130-false        
        Jump         -compare-130-true         
        Label        -compare-130-true         
        PushI        1                         
        Jump         -compare-130-join         
        Label        -compare-130-false        
        PushI        0                         
        Jump         -compare-130-join         
        Label        -compare-130-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-131-false        
        Jump         -compare-131-true         
        Label        -compare-131-true         
        PushI        1                         
        Jump         -compare-131-join         
        Label        -compare-131-false        
        PushI        0                         
        Jump         -compare-131-join         
        Label        -compare-131-join         
        JumpTrue     -print-boolean-132-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-132-join   
        Label        -print-boolean-132-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-132-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-133-false        
        Jump         -compare-133-true         
        Label        -compare-133-true         
        PushI        1                         
        Jump         -compare-133-join         
        Label        -compare-133-false        
        PushI        0                         
        Jump         -compare-133-join         
        Label        -compare-133-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-134-false        
        Jump         -compare-134-true         
        Label        -compare-134-true         
        PushI        1                         
        Jump         -compare-134-join         
        Label        -compare-134-false        
        PushI        0                         
        Jump         -compare-134-join         
        Label        -compare-134-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-135-false        
        Jump         -compare-135-true         
        Label        -compare-135-true         
        PushI        1                         
        Jump         -compare-135-join         
        Label        -compare-135-false        
        PushI        0                         
        Jump         -compare-135-join         
        Label        -compare-135-join         
        JumpTrue     -print-boolean-136-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-136-join   
        Label        -print-boolean-136-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-136-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-137-false        
        Jump         -compare-137-true         
        Label        -compare-137-true         
        PushI        1                         
        Jump         -compare-137-join         
        Label        -compare-137-false        
        PushI        0                         
        Jump         -compare-137-join         
        Label        -compare-137-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-138-false        
        Jump         -compare-138-true         
        Label        -compare-138-true         
        PushI        1                         
        Jump         -compare-138-join         
        Label        -compare-138-false        
        PushI        0                         
        Jump         -compare-138-join         
        Label        -compare-138-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-139-false        
        Jump         -compare-139-true         
        Label        -compare-139-true         
        PushI        1                         
        Jump         -compare-139-join         
        Label        -compare-139-false        
        PushI        0                         
        Jump         -compare-139-join         
        Label        -compare-139-join         
        JumpTrue     -print-boolean-140-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-140-join   
        Label        -print-boolean-140-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-140-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-141-false        
        Jump         -compare-141-true         
        Label        -compare-141-true         
        PushI        1                         
        Jump         -compare-141-join         
        Label        -compare-141-false        
        PushI        0                         
        Jump         -compare-141-join         
        Label        -compare-141-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-142-false        
        Jump         -compare-142-true         
        Label        -compare-142-true         
        PushI        1                         
        Jump         -compare-142-join         
        Label        -compare-142-false        
        PushI        0                         
        Jump         -compare-142-join         
        Label        -compare-142-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-143-false        
        Jump         -compare-143-true         
        Label        -compare-143-true         
        PushI        1                         
        Jump         -compare-143-join         
        Label        -compare-143-false        
        PushI        0                         
        Jump         -compare-143-join         
        Label        -compare-143-join         
        JumpTrue     -print-boolean-144-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-144-join   
        Label        -print-boolean-144-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-144-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-145-false        
        Jump         -compare-145-true         
        Label        -compare-145-true         
        PushI        1                         
        Jump         -compare-145-join         
        Label        -compare-145-false        
        PushI        0                         
        Jump         -compare-145-join         
        Label        -compare-145-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-146-false        
        Jump         -compare-146-true         
        Label        -compare-146-true         
        PushI        1                         
        Jump         -compare-146-join         
        Label        -compare-146-false        
        PushI        0                         
        Jump         -compare-146-join         
        Label        -compare-146-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-147-false        
        Jump         -compare-147-true         
        Label        -compare-147-true         
        PushI        1                         
        Jump         -compare-147-join         
        Label        -compare-147-false        
        PushI        0                         
        Jump         -compare-147-join         
        Label        -compare-147-join         
        JumpTrue     -print-boolean-148-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-148-join   
        Label        -print-boolean-148-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-148-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        1                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-149-false        
        Jump         -compare-149-true         
        Label        -compare-149-true         
        PushI        1                         
        Jump         -compare-149-join         
        Label        -compare-149-false        
        PushI        0                         
        Jump         -compare-149-join         
        Label        -compare-149-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-150-false        
        Jump         -compare-150-true         
        Label        -compare-150-true         
        PushI        1                         
        Jump         -compare-150-join         
        Label        -compare-150-false        
        PushI        0                         
        Jump         -compare-150-join         
        Label        -compare-150-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-151-false        
        Jump         -compare-151-true         
        Label        -compare-151-true         
        PushI        1                         
        Jump         -compare-151-join         
        Label        -compare-151-false        
        PushI        0                         
        Jump         -compare-151-join         
        Label        -compare-151-join         
        JumpTrue     -print-boolean-152-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-152-join   
        Label        -print-boolean-152-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-152-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-153-false        
        Jump         -compare-153-true         
        Label        -compare-153-true         
        PushI        1                         
        Jump         -compare-153-join         
        Label        -compare-153-false        
        PushI        0                         
        Jump         -compare-153-join         
        Label        -compare-153-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-154-false        
        Jump         -compare-154-true         
        Label        -compare-154-true         
        PushI        1                         
        Jump         -compare-154-join         
        Label        -compare-154-false        
        PushI        0                         
        Jump         -compare-154-join         
        Label        -compare-154-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-155-false        
        Jump         -compare-155-true         
        Label        -compare-155-true         
        PushI        1                         
        Jump         -compare-155-join         
        Label        -compare-155-false        
        PushI        0                         
        Jump         -compare-155-join         
        Label        -compare-155-join         
        JumpTrue     -print-boolean-156-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-156-join   
        Label        -print-boolean-156-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-156-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-157-false        
        Jump         -compare-157-true         
        Label        -compare-157-true         
        PushI        1                         
        Jump         -compare-157-join         
        Label        -compare-157-false        
        PushI        0                         
        Jump         -compare-157-join         
        Label        -compare-157-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-158-false        
        Jump         -compare-158-true         
        Label        -compare-158-true         
        PushI        1                         
        Jump         -compare-158-join         
        Label        -compare-158-false        
        PushI        0                         
        Jump         -compare-158-join         
        Label        -compare-158-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-159-false        
        Jump         -compare-159-true         
        Label        -compare-159-true         
        PushI        1                         
        Jump         -compare-159-join         
        Label        -compare-159-false        
        PushI        0                         
        Jump         -compare-159-join         
        Label        -compare-159-join         
        JumpTrue     -print-boolean-160-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-160-join   
        Label        -print-boolean-160-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-160-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        0                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-161-false        
        Jump         -compare-161-true         
        Label        -compare-161-true         
        PushI        1                         
        Jump         -compare-161-join         
        Label        -compare-161-false        
        PushI        0                         
        Jump         -compare-161-join         
        Label        -compare-161-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-162-false        
        Jump         -compare-162-true         
        Label        -compare-162-true         
        PushI        1                         
        Jump         -compare-162-join         
        Label        -compare-162-false        
        PushI        0                         
        Jump         -compare-162-join         
        Label        -compare-162-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-163-false        
        Jump         -compare-163-true         
        Label        -compare-163-true         
        PushI        1                         
        Jump         -compare-163-join         
        Label        -compare-163-false        
        PushI        0                         
        Jump         -compare-163-join         
        Label        -compare-163-join         
        JumpTrue     -print-boolean-164-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-164-join   
        Label        -print-boolean-164-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-164-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        PushI        0                         
        Nop                                    
        PushI        1                         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-165-false        
        Jump         -compare-165-true         
        Label        -compare-165-true         
        PushI        1                         
        Jump         -compare-165-join         
        Label        -compare-165-false        
        PushI        0                         
        Jump         -compare-165-join         
        Label        -compare-165-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-166-false        
        Jump         -compare-166-true         
        Label        -compare-166-true         
        PushI        1                         
        Jump         -compare-166-join         
        Label        -compare-166-false        
        PushI        0                         
        Jump         -compare-166-join         
        Label        -compare-166-join         
        Nop                                    
        Subtract                               
        JumpFalse    -compare-167-false        
        Jump         -compare-167-true         
        Label        -compare-167-true         
        PushI        1                         
        Jump         -compare-167-join         
        Label        -compare-167-false        
        PushI        0                         
        Jump         -compare-167-join         
        Label        -compare-167-join         
        JumpTrue     -print-boolean-168-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-168-join   
        Label        -print-boolean-168-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-168-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
