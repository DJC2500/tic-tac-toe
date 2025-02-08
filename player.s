
  AREA    |.text|, CODE, READONLY
  PRESERVE8;
  THUMB;


  EXPORT player_check_move_s

player_check_move_s FUNCTION	; char player_check_move_s(player_t *player, int row, int col);
	; r0 *player
	; r1 row
	; r2 col
	PUSH {R4-R5,LR};
	MOV R3,R0;
	
	LDRH R0,[R3,#0x00];
	ADD R5,R2,R1,LSL #2;
	MOVS R4, #0x01;
	LSLS R4,R4,R5;
	ANDS R0,R0,R4;
	CBZ R0, z;
	MOVS R0,0x00;
	
	POP {R4-R5, PC};
z	BX	LR						; return
  ENDFUNC
  

  EXPORT player_make_move_s

player_make_move_s FUNCTION	; char player_make_move_s(player_t *player, int row, int col);
	; r0 *player
	; r1 row
	; r2 col
	
	PUSH {R4-R5,LR};
	MOV R3,R0;
	
	LDRH R0,[R3,#0x00];
	ADD R5,R2,R1,LSL #2;
	MOVS R4, #0x01;
	LSLS R4,R4,R5;
	ANDS R0,R0,R4;
	CBZ R0, Y;
	MOVS R0,#0x00;
	
X	POP {R4-R5, PC};
	
Y 	LDRH R0,[R3,#0x00];
	ADD R5,R2,R1,LSL #2;
	MOVS R4, #0x01 ;
	LSLS R4,R0,R4;
	ORRS R0,R0,R4;
	STRH R0,[R3,#0x00];
	MOV	R0,#0x01;
	BX LR				; return
  ENDFUNC
  
  EXPORT player_won_s

player_won_s FUNCTION	; char player_won_s(player_t * player);
	; r0 *player
	PUSH {R1, R2}
    LDR R1, [R0]
    MOV R3, #0x0007
    CMP R2, R1, R3
    BEQ EXIT
    MOV R3, #0x0070
    CMP R2, R1, #0x0070
    BEQ EXIT
    MOV R3, #0x0700
    CMP R2, R1, R3
    BEQ, EXIT
    MOV R3, #0x0111
    CMP R2, R1, R3
    BEQ, EXIT
    MOV R3, #0x0222
    CMP R2, R1, R3
    BEQ EXIT
    MOV R3, #0x0444
    CMP R2, R1, R3
    BEQ EXIT
    MOV R3, #0x421
    CMP R2, R1, R3
    BEQ EXIT
    MOV R3, #0x124
    CMP R2, R1, R3
    BEQ EXIT
    MOV R0, #0
    POP {R1,R2}
    BX LR
EXIT
    MOV    R0, #1    
    POP {R1,R2}
    BX    LR               	; return
  ENDFUNC
  
  END