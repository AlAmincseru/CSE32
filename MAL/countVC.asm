                                                                                                                       .MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter a string : $'
   PROMPT_2  DB  0DH,0AH,'No. of Vowels = $'
   PROMPT_3  DB  0DH,0AH,'No. of Consonants = $'

   STRING        DB  50 DUP (?)   
   C_VOWELS      DB  'AEIOU'
   S_VOWELS      DB  'aeiou'
   C_CONSONANTS  DB  'BCDFGHJKLMNPQRSTVWXYZ'
   S_CONSONANTS  DB  'bcdfghjklmnpqrstvwxyz'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS and ES
     MOV DS, AX
     MOV ES, AX

     LEA DX, PROMPT_1             ; load and display the string PROMPT_1
     MOV AH, 9
     INT 21H

     LEA DI, STRING               ; set DI=offset address of variable STRING

     CALL READ_STR                ; call the procedure READ_STR

     XOR DX, DX                   ; clear DX
     LEA SI, STRING               ; set SI=offset address of variable STRING

     OR BX, BX                    ; check BX for 0
     JE @EXIT                     ; jump to label @EXIT if BX=0

     @COUNT:                      ; jump label
       LODSB                      ; set AL=DS:SI

       LEA DI, C_VOWELS           ; set DI=offset address of variable C_VOWELS
       MOV CX, 5                  ; set CX=5

       REPNE SCASB                ; check AL is capital vowel or not
       JE @INCREMENT_VOWELS       ; jump to label @INCREMENT_VOWELS if AL is
                                  ; capital vowel

       LEA DI, S_VOWELS           ; set DI=offset address of variable S_VOWELS
       MOV CX, 5                  ; set CX=5

       REPNE SCASB                ; check AL is small vowel or not
       JE @INCREMENT_VOWELS       ; jump to label @INCREMENT_VOWELS if AL is
                                  ; small vowel

       LEA DI, C_CONSONANTS       ; set DI=offset address of variable
                                  ; C_CONSONANTS
       MOV CX, 21                 ; set CX=21

       REPNE SCASB                ; check AL is capital consonant or not
       JE @INCREMENT_CONSONANTS   ; jump to label @INCREMENT_CONSONANTS if AL
                                  ; is capital consonant

       LEA DI, S_CONSONANTS       ;  set DI=offset address of variable
                                  ; S_CONSONANTS
       MOV CX, 21                 ; set CX=21

       REPNE SCASB                ; check AL is small consonant or not
       JE @INCREMENT_CONSONANTS   ; jump to label @INCREMENT_CONSONANTS if AL
                                  ; is small consonants

       JMP @NEXT                  ; otherwise, jump to label @NEXT

       @INCREMENT_VOWELS:         ; jump label
         INC DL                   ; increment DL
         JMP @NEXT                ; jump to label @NEXT

       @INCREMENT_CONSONANTS:     ; jump label
         INC DH                   ; increment DH

       @NEXT:                     ; jump label
         DEC BX                   ; decrement BX
         JNE @COUNT               ; jump to label @COUNT while BX!=0

       @EXIT:                     ; jump label

     MOV CX, DX                   ; set CX=DX

     LEA DX, PROMPT_2             ; load and display the string PROMPT_2
     MOV AH, 9                     
     INT 21H                       

     XOR AX, AX                   ; clear AX
     MOV AL, CL                   ; set AL=CL

     CALL OUTDEC                  ; call the procedure OUTDEC

     LEA DX, PROMPT_3             ; load and display the string PROMPT_3
     MOV AH, 9
     INT 21H

     XOR AX, AX                   ; clear AX
     MOV AL, CH                   ; set AL=CH

     CALL OUTDEC                  ; call the procedure OUTDEC

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP