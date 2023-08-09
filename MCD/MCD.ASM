TITLE	 Food & Beverage Ordering System		; TITLE directive

.MODEL	SMALL							; declare the memory model used (SMALL)
.STACK	64							; declare STACK segment
.DATA								; declare DATA segment

	; Header DATA segment 
	; -------------------------------------------------------------------------------------------------------------
	HEADER1	DB	10 , 13 , "			+============================+ $" 
	HEADER2	DB	10 , 13 , "			|  McDonald Ordering System  | $" 
	HEADER3	DB 	10 , 13 , "			|        Since 1940          | $"
	HEADER4	DB	10 , 13 , "			| Operational Hours: 8AM-8PM | $"
	HEADER5	DB	10 , 13 , "			+============================+ $"
	HEADER6	DB	10 , 13 , " 			Good to see you here! Welcome! $"
	HEADER7	DB	10 , 13 , "	 	       ................................ $"


	; Advertisement module DATA segment 
	; -------------------------------------------------------------------------------------------------------------
	ADV		DB	10 , 13 , " 	The following is the advertisement of the day....$"
	ADV1		DB	10 , 13 , " 	--------------------------------------------------------------$"
	ADV2		DB	10 , 13 , " 	|							     |$"
	ADV3		DB	10 , 13 , " 	|	AWESOME!!!! We have special meal today!!! 	     |$"
	ADV4		DB	10 , 13 , " 	|		We have special meal this week!!!  	     |$"
	ADV5		DB	10 , 13 , " 	| There are Spicy McChicken Deluxe Meal and Oreo McFlurry!!!!|$"
	ADV6		DB	10 , 13 , " 	|							     |$"
	ADV7		DB	10 , 13 , " 	|------------------------------------------------------------|$"
	ADV8		DB	10 , 13 , " 	| Frequently asked question:                                 |$"
	ADV9		DB	10 , 13 , " 	| Q: Can I ask if the meal includes drinks and french fries? |$"
	ADV10		DB	10 , 13 , " 	| A: Sorry, the meal is not included.                        |$"
	ADV11		DB	10 , 13 , " 	| Q: Can I change the flavour of McFlurry?		     |$"
	ADV12		DB	10 , 13 , " 	| A: Sorry, the flavour is unchangeable.		     |$"
	ADV13		DB	10 , 13 , " 	|<---------Hope you all the best and happy every day-------->|$"
	ADV14		DB	10 , 13 , " 	--------------------------------------------------------------$"
	TXT		DB	10 , 13 , " 	Press any key to continue ...$"
	CONT		DB	?


	; Login module DATA segment 
	; -------------------------------------------------------------------------------------------------------------
	USER_ID	DB	10,13,"Please enter USER ID: $"
	INVALID	DB	10,13,"Invalid User ID !!! $"
	VALID	DB	10,13,"Login Successful ! $"
	IN_USERID	DB	5 DUP(?)
	

	; Payment module DATA segment 
	; -------------------------------------------------------------------------------------------------------------
	; Menu Format
	; -----------------------
	MSECTION1	DB 	10 , 13 , "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Food Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" , 10 , 13 , "$"	
	MSECTION2	DB 	"	    	 MEAL		     	      Price (RM) " , 10 , 13 , "$"
	MSECTION3 	DB	"	------------------------------      -------------" , 10, 13 , "$"		 
	MNAME1		DB 	"	1. Filet-O-Fish Meal		   	RM 15" , 10 , 13 , "$"
	MNAME2		DB 	"	2. Spicy McChicken Deluxe Meal	    	RM 19" , 10 , 13 , "$"
	MNAME3		DB 	"	3. Double Cheeseburger Meal		RM 17" , 10 , 13 , "$"
	MNAME4		DB 	"	4. Smoky Grilled Beef Meal		RM 20" , 10 , 13 , "$"
	MNAME5		DB 	"	5. Oreo McFlurry			RM  7" , 10 , 13 , "$"
	MNAME6		DB 	" 	6. Apple Pie			    	RM  4" , 10 , 13 , "$"
	CSECTION1	DB 	10 , 13 , "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Customize Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" , 10 , 13 , "Do You Want Vegetable ? (Y = YES || N = NO) $"
	CSECTION2 	DB	10 , 13 , "Do You Want Fries     ? (Y = YES || N = NO) $"
	CSECTION3	DB	10 , 13 , "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" , 10 , 13 , "$" 
	MCUST		DB	10 DUP (?)
	TAKEORDER	DB	10 , 13 , "	WHAT YOU WANT TO ORDER? >>> MEAL $"
	CONTINUEORDER	DB	10 , 13 , "WANT TO CONTINUE ORDER? (Y/N) >>> $"
	TEMP		DB	?
	DECPOINT	DB	".00$"
	DOT		DB	".$"
	INVALID_MEAL	DB	10,13,"-------------------------- !!! Invalid Meal ID !!! --------------------------$"

	; Food Name, Quantity and Price
	; --------------------------------------------------
	ORDNAME1	DB	10 , 13 , "	Filet-O-Fish Meal			x $"
	QTY1		DB	0
	ORDQTY1	DB	16 DUP (0)
	MEAL1		DB	15
	ORDNAME2	DB	10 , 13 , "	Spicy McChicken Deluxe Meal		x $"
	QTY2		DB	0
	ORDQTY2	DB	16 DUP (0)
	MEAL2		DB	19
	ORDNAME3	DB	10 , 13 , "	Double Cheeseburger Meal		x $"
	QTY3		DB	0
	ORDQTY3	DB	16 DUP (0)
	MEAL3		DB	17
	ORDNAME4	DB	10 , 13 , "	Smoky Grilled Beef Meal			x $"
	QTY4		DB	0
	ORDQTY4	DB	16 DUP (0)	
	MEAL4		DB	20
	ORDNAME5	DB	10 , 13 , "	Oreo McFlurry				x $"
	QTY5		DB	0
	ORDQTY5	DB	16 DUP (0)
	MEAL5		DB	7
	ORDNAME6	DB	10 , 13 , "	Apple Pie				x $"
	QTY6		DB	0
	ORDQTY6	DB	16 DUP (0)
	MEAL6		DB	4


	; Subtotal, Total Tax and Total Price
	; ----------------------------------------------------------
	SUBTOTAL	DB	0
	TAX		DB	0	
	TOTAL		DB	?

	CSST1		DB	5
	CSST2		DB	100
	SST1		DB	?
	SST2		DB	?
	R1		DB	?
	R2		DB	?
	R3		DB	?
	R4		DB	?
	TEMP1		DB	0
	TEMP2 		DB	0	
	RM		DB 	"	Sub-total : RM $"
	TTAX		DB	10 , 13 , "	Tax       : RM $"
	TOTAL1		DB	10 , 13 , "	Total	  : RM $"
	RTOTAL	 	DB 	16 DUP (0)


	; Receipt module DATA segment 
	; -------------------------------------------------------------------------------------------------------------
	; Receipt Format
	; ---------------------------
	RTITLE		DB 	10 , 13 , " **********************************  Receipt  *********************************" , 10 , 13 , "$"
	RGREET		DB	10 , 13 , "	Mr. / Ms. , This is your transaction details. $"	
	RATTEMPT	DB 	10 , 13 , "	Total Attempt >>  $"
	RLINE1	 	DB	10 , 13 , "   --------------------------------------------------------------------------" , 10, 13 , "$"
	RTHANK		DB	10 , 13 , "		THANK YOU FOR YOUR ORDER ! HAVE A NICE DAY !$"
	RCLOSE		DB 	10 , 13 , "  *****************************************************************************$"
	

	; Total Attempt by The User
	; ---------------------------------------
	ATTEMPT	DB	0
	TATTEMPT	DB	16 DUP (0)

; ------------------------------------------------------------------------------------------------------  Code Start  -----------------------------------------------------------------------------------------------------------------

.CODE						; declare CODE segment

	MAIN	PROC	FAR			; MAIN procedure starts here

	MOV	AX , @DATA			; initialise DS register
	MOV	DS , AX		

	; Login module 
	; --------------------------------------------------------------------------------------------------------------------------------------------------------------------

ASKID:	
	MOV	AH , 09H			; ASK USER ENTER USERID
	LEA	DX , USER_ID
	INT	21H

	MOV	CX , 3			;CHANGE CX -> 3, LOOP 3 TIMES to check userid
	MOV	BX , 0			;CHANGE BX -> 0

ACCEPT_ID:	
	MOV	AH , 07H			; ACCEPT USER_ID W/echo
	INT	21H
	MOV	IN_USERID[BX],AL

	MOV	AH , 02H	; DISPLAY '*'	AFTER ENTER A CHARACTER
	MOV	DL , '*'
	INT	21H

	INC	BX 		;INCREASE BX TO INCREASE THE INDEX
	LOOP	ACCEPT_ID		;LOOP ACCEPT_ID TO ENTER OTHER CHARACTER
	 
	MOV	BX , 0		

; ------------------------------------CHECK USERID 'mcd'------------------------------------------------

	CMP	IN_USERID[BX] , 'm'				
	JNE 	INMSG			;IF WRONG, JMP TO INMSG (display invalid msg)
	INC	BX

	CMP	IN_USERID[BX] , 'c'				
	JNE 	INMSG	
	INC	BX

	CMP	IN_USERID[BX] , 'd'				
	JNE 	INMSG		
	INC	BX
	JMP	CORRECT_MSG 		;IF CORRECT, JMP TO CORRECT_MSG (display valid msg)

; ----------------------------------------IF WRONG USERID------------------------------------------

INMSG:	
	MOV	AH , 09H			;DISPLAY INVALID MSG
	LEA	DX , INVALID
	INT	21H
	JMP	ASKID			;JMP TO ASKID :ASK USER ENTER ID	


; ----------------------------------------IF CORRECT USERID-----------------------------------------------
CORRECT_MSG :	
	MOV	AH , 09H			;DISPLAY VALID MSG
	LEA 	DX , VALID
	INT	21H
	JMP	HOME

;-----------------------------------------DISPLAY HEADER----------------------------------------------	
HOME:
	MOV	AH , 09H
	LEA	DX , HEADER1			;display HEADER1
	INT	21H
	
	LEA	DX , HEADER2			;display HEADER2
	INT	21H

	LEA	DX , HEADER3			;display HEADER3
	INT	21H	

	LEA	DX , HEADER4			;display HEADER4
	INT	21H

	LEA	DX , HEADER5			;display HEADER5
	INT	21H	

	LEA	DX , HEADER6			;display HEADER6
	INT	21H

	LEA	DX , HEADER7			;display HEADER7
	INT	21H

	MOV	AH , 02H
	MOV	DL , 0DH
	INT	21H					;go to new line (\n) ----> displaying CR and LF characters
	MOV	DL , 0AH
	INT	21H


; ------------------------------------------------------------------------------------ Advertisement module ------------------------------------------------------------------------------------------

	MOV	AH , 09H
	LEA	DX , ADV				;display ADV
	INT 21H
		
	LEA	DX , ADV1			;display ADV1
	INT 21H
					
	LEA	DX , ADV2			;display ADV2
	INT 21H

	LEA	DX , ADV3			;display ADV3
	INT 21H

	LEA	DX , ADV4			;display ADV4
	INT 21H
	
	LEA	DX , ADV5			;display ADV5
	INT 21H

	LEA	DX , ADV6			;display ADV6
	INT 21H

	LEA	DX , ADV7			;display ADV7
	INT 21H

	LEA	DX , ADV8			;display ADV8
	INT 21H

	LEA	DX , ADV9			;display ADV9
	INT 21H

	LEA	DX , ADV10			;display ADV10
	INT 21H

	LEA	DX , ADV11			;display ADV11
	INT 21H

	LEA	DX , ADV12			;display ADV12
	INT 21H

	LEA	DX , ADV13			;display ADV13
	INT 21H

	LEA	DX , ADV14			;display ADV14
	INT 21H

	; ---------------- Stop the process ----------------
	; To let the user read the advertisement

	LEA	DX , TXT				;display CONT
	INT 21H
	
	MOV	AH , 01H				; accept a character
	INT	21H				; the char accepted will be store automatically to AL register
	MOV	CONT , AL			; to protect the AL value by moving it into CONT

	CMP	CONT , "1"
	JE	CONTINUE		; jump to CONTINUE (Continue the process)


; ------------------------------------------------------------------------------------ Payment module ------------------------------------------------------------------------------------------

CONTINUE:
	MOV	AH , 09H
	LEA	DX , MSECTION1			; display MSECTION1
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MSECTION2			; display MSECTION2
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MSECTION3			; display MSECTION3
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MNAME1			; display MNAME1
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MNAME2			; display MNAME2
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MNAME3			; display MNAME3
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MNAME4			; display MNAME4
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MNAME5			; display MNAME5
	INT 	21H

	MOV	AH , 09H
	LEA	DX , MNAME6			; display MNAME6
	INT 	21H

; Loop
; -----------------------------------------------------------------------------------

RUN:	
	MOV	AH , 09H
	LEA	DX , TAKEORDER			; display TAKEORDER
	INT 	21H

	MOV	AH , 01H				; accept a character
	INT	21H				; the char accepted will be store automatically to AL register
	MOV	TEMP , AL			; to protect the AL value by moving it into TEMP

	MOV	AH , 02H
     	MOV	DL , 0DH
     	INT	21H				; go to new line
     	MOV	DL , 0AH	
     	INT	21H

	; ------------------------------------------- IF MEAL 1----------------------------------------------
	CMP	TEMP , "1"			; compare TEMP to "1"
	JE	L1				; jump to L1

	; ------------------------------------------- IF MEAL 2 ----------------------------------------------
	CMP 	TEMP , "2"			; compare TEMP to "2"
	JE	L2				; jump to L2

	; ------------------------------------------- IF MEAL 3 ----------------------------------------------
	CMP 	TEMP , "3"			; compare TEMP to "3"
	JE	L3				; jump to L3

	; ------------------------------------------- IF MEAL 4 ----------------------------------------------
	CMP 	TEMP , "4"			; compare TEMP to "4"
	JE	L4				; jump to L4

	; ------------------------------------------- IF MEAL 5 ----------------------------------------------
	CMP 	TEMP , "5"			; compare TEMP to "5"
	JE	L5				; jump to L5

	; ------------------------------------------- IF MEAL 6 ----------------------------------------------
	CMP 	TEMP , "6"			; compare TEMP to "6"
	JE	A1				; jump to L6
	;------------------------------------IF MEAL 7-9 & 0 (Invalid meal)--------------------------------
	CMP 	TEMP , "7"
	JE	L0				;jump to L0 to display invalid msg
	
	CMP 	TEMP , "8"
	JE	L0

	CMP 	TEMP , "9"
	JE	L0

	CMP 	TEMP , "0"
	JE	L0

A1:
	JE	L6
; ------------------------------------ Calculate Food Price and Add into Subtotal ----------------------------------------------
L0: 	
	MOV	AH , 09H
	LEA	DX , INVALID_MEAL		;display invalid meal id message
	INT 	21H
	JNO	RUN

L1:	
	MOV	AL , SUBTOTAL			; move SUBTOTAL to AX
	ADD	AL , MEAL1			; add 15 to SUBTOTAL
	MOV	SUBTOTAL , AL			; store sum back to SUBTOTAL

	INC 	QTY1			; increment L1 food quantity (+1)
	INC	ATTEMPT			; increment total attempt (+1)
	JNO	CUST			; jump to CUST

L2:	
	MOV	AL , SUBTOTAL			; move SUBTOTAL to AX
	ADD	AL , MEAL2			; add 19 to SUBTOTAL
	MOV	SUBTOTAL , AL			; store sum back to SUBTOTAL
	INC 	QTY2			; increment L2 food quantity (+1)
	INC	ATTEMPT			; increment total attempt (+1)
	JNO	CUST			; jump to CUST

L3:	
	MOV	AL , SUBTOTAL			; move SUBTOTAL to AX
	ADD	AL , MEAL3			; add 17 to SUBTOTAL
	MOV	SUBTOTAL , AL			; store sum back to SUBTOTAL

	INC 	QTY3			; increment L3 food quantity (+1)
	INC	ATTEMPT			; increment total attempt (+1)
	JNO	CUST			; jump to CUST

L4:	
	MOV	AL , SUBTOTAL			; move SUBTOTAL to AX
	ADD	AL , MEAL4			; add 20 to SUBTOTAL
	MOV	SUBTOTAL , AL			; store sum back to SUBTOTAL

	INC 	QTY4			; increment L4 food quantity (+1)
	INC	ATTEMPT			; increment total attempt (+1)
	JNO	CUST			; jump to CUST

L5:	
	MOV	AL , SUBTOTAL			; move SUBTOTAL to AX
	ADD	AL , MEAL5			; add 7 to SUBTOTAL
	MOV	SUBTOTAL , AL			; store sum back to SUBTOTAL

	INC 	QTY5			; increment L5 food quantity (+1)
	INC	ATTEMPT			; increment total attempt (+1)
	JNO 	MSG			; jump to MSG

L6:	
	MOV	AL , SUBTOTAL			; move SUBTOTAL to AX
	ADD	AL , MEAL6			; add 4 to SUBTOTAL
	MOV	SUBTOTAL , AL			; store sum back to SUBTOTAL

	INC 	QTY6			; increment L6 food quantity (+1)
	INC	ATTEMPT			; increment total attempt (+1)
	JNO 	MSG			; jump to MSG

; -------------------------- Jumper --------------------------
;  to increase jump distance due to relative jump out of range
JUMPER:	
	JMP 	RUN			; jump to RUN

; ------------------------------------------------ Customize Menu ------------------------------------------

CUST:
	MOV	AH , 09H
	LEA	DX , CSECTION1			; display CSECTION1
	INT 	21H	

	MOV	AH , 01H			; accept a character
	INT	21H				; the char accepted will be store automatically to AL register
	MOV	MCUST , AL			; to protect the AL value by moving it into MCUST
	MOV	AH , 09H

	LEA	DX , CSECTION2			; display CSECTION2
	INT 	21H

	MOV	AH , 01H			; accept a character
	INT	21H				; the char accepted will be store automatically to AL register
	MOV	MCUST , AL			; to protect the AL value by moving it into MCUST
	MOV	AH , 09H

	LEA	DX , CSECTION3			; display CSECTION3
	INT 	21H
	
	JNO 	MSG			; jump to MSG

; --------------------------------------------- Continue Ordering Message ----------------------------------------

MSG:	MOV	AH , 09H
	LEA 	DX , CONTINUEORDER		; display CONTINUEORDER
	INT	21H
	
	MOV	AH , 01H			; accept a character
	INT	21H				; the char accepted will be store automatically to AL register
	MOV	TEMP , AL			; to protect the AL value by moving it into TEMP

	CMP	TEMP , "Y"			; compare TEMP to "Y"
	JE	JUMPER				; jump to JUMPER

	CMP	TEMP , "y"			; compare TEMP to "y"
	JE	JUMPER				; jump to JUMPER

	CMP	TEMP , "N"			; compare TEMP to "N"
	JE	NORUN				; jump to NORUN

	CMP	TEMP , "n"			; compare TEMP to "n"
	JE	NORUN				; jump to NORUN



; ------------------------------------------------------------------------------------ Receipt module ------------------------------------------------------------------------------------------

NORUN:	
	MOV	AH , 02H
     	MOV	DL , 0DH
     	INT	21H			; go to new line
	MOV	DL , 0AH	
     	INT	21H

	; Convert Total Attempt Value
	; -----------------------------------------------------------------------------------

	MOV 	AH , 00
	MOV 	AL , ATTEMPT
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

CONVERT:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	CONVERT		; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , TATTEMPT 			; DS:SI points to your buffer

GET_VALUE:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_VALUE

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

; ------------------------------- Convert Total Ordered Food Quantity ---------------------------------------------------

	MOV 	AH , 00
	MOV 	AL , QTY1
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

CONVERT1:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	CONVERT1		; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , ORDQTY1			; DS:SI points to your buffer

GET_QTY1:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_QTY1

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

	MOV 	AH , 00
	MOV 	AL , QTY2
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

CONVERT2:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	CONVERT2 		; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , ORDQTY2			; DS:SI points to your buffer

GET_QTY2:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_QTY2

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

	MOV 	AH , 00
	MOV 	AL , QTY3
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

CONVERT3:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	CONVERT3 		; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , ORDQTY3			; DS:SI points to your buffer

GET_QTY3:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_QTY3

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

	MOV 	AH , 00
	MOV 	AL , QTY4
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

CONVERT4:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	CONVERT4		; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , ORDQTY4			; DS:SI points to your buffer

GET_QTY4:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_QTY4

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

	MOV 	AH , 00
	MOV 	AL , QTY5
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

CONVERT5:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	CONVERT5 		; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , ORDQTY5			; DS:SI points to your buffer

GET_QTY5:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_QTY5

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

	MOV 	AH , 00
	MOV 	AL , QTY6
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

CONVERT6:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	CONVERT6 		; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , ORDQTY6			; DS:SI points to your buffer

GET_QTY6:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_QTY6

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

; ----------------------------------------------------------    Receipt Display    --------------------------------------------------------------------

	MOV	AH , 09H
	LEA	DX , RTITLE			; display RTITLE (Receipt Title)
	INT 	21H
	
	MOV	AH , 09H
	LEA	DX , RGREET			; display RGREET (Greeting)
	INT 	21H

	MOV	AH , 09H
	LEA	DX , RATTEMPT			; display RATTEMPT (Total Attempt >> )
	INT 	21H

	MOV	AH , 09H
	LEA	DX , TATTEMPT			; display TATTEMPT (Total Attempt)
	INT 	21H

	MOV	AH , 09H
	LEA	DX , RLINE1			; display RLINE1 (Break Line)
	INT 	21H

; -----------------------------  Food Quantity Checkings ------------------------------

 	CMP	QTY1 , 0     		; check whether the L1 food quantity is > 1 or not
 	JNE     	JUMPER1 		; if > 1, jump to JUMPER1
	JZ	CHECK2			; if = 0, jump to CHECK2

CHECK2:
	CMP	QTY2 , 0      		; check whether the L2 food quantity is > 1 or not   
 	JNE     	JUMPER2			; if > 1, jump to JUMPER2
	JZ	CHECK3			; if = 0, jump to CHECK3  

CHECK3:
	CMP	QTY3 , 0      		; check whether the L3 food quantity is > 1 or not
 	JNE     	JUMPER3			; if > 1, jump to JUMPER3
	JZ	CHECK4			; if = 0, jump to CHECK4 

CHECK4:
	CMP	QTY4 , 0     		; check whether the L4 food quantity is > 1 or not
 	JNE     	JUMPER4			; if > 1, jump to JUMPER4  
	JZ	CHECK5			; if = 0, jump to CHECK5

CHECK5:
	CMP	QTY5 , 0     		; check whether the L5 food quantity is > 1 or not
 	JNE     	JUMPER5			; if > 1, jump to JUMPER5 
	JZ	CHECK6			; if = 0, jump to CHECK6

CHECK6:
	CMP	QTY6 , 0      		; check whether the L6 food quantity is > 1 or not
 	JNE     	JUMPER6			; if > 1, jump to JUMPER6
	JZ	DONE			; if = 0, jump to DONE

; -----------------------------------  Display Break Line -------------------------------------------

DONE:
	MOV	AH , 02H
     	MOV	DL , 0DH
     	INT	21H				; go to new line 
	MOV	DL , 0AH	
     	INT	21H
	
	MOV	AH , 09H
	LEA	DX , RLINE1			; display RLINE1 (Break Line)
	INT 	21H

	MOV	AH , 02H
     	MOV	DL , 0DH
     	INT	21H				; go to new line 
	MOV	DL , 0AH	
     	INT	21H

	;-------------------------Convert num to string and display it out-------------------------

	MOV 	AH , 00
	MOV 	AL , SUBTOTAL
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

DIVIDE:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	DIVIDE 				; EAX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , RTOTAL 			; DS:SI points to your buffer
	JMP	SKIP		; jump to SKIP (to avoid the jumpers and infinite looping)
	
; ----------------- Jumpers --------------------------
;  to increase jump distance due to relative jump out of range

JUMPER1:
	JMP	ORDERED1		; jump to ORDERED1
JUMPER2:
	JMP	ORDERED2		; jump to ORDERED2
JUMPER3:
	JMP	ORDERED3		; jump to ORDERED3
JUMPER4:
	JMP	ORDERED4		; jump to ORDERED4
JUMPER5:
	JMP	ORDERED5		; jump to ORDERED5
JUMPER6:
	JMP	ORDERED6		; jump to ORDERED6

; -----------------------------------  Display Price -------------------------------------------

SKIP:
GET_DIGIT:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_DIGIT

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

	MOV 	AH , 09H
	LEA 	DX , RM				; display RM
	INT 	21H

	MOV 	AH , 09H
	LEA 	DX , RTOTAL			; display STROUTPUT
	INT 	21H

	MOV 	AH , 09H
	LEA 	DX , DECPOINT			; display DECPOINT
	INT 	21H
	JMP	CALTAX		; jump to CALTAX (to avoid the jumper and infinite looping)

; ----------------- Jumper --------------------------
;  to increase jump distance due to relative jump out of range

TOEXIT:
	JMP	EXIT		; jump to EXIT

;---------------------------- Calculate TAX ----------------------------

CALTAX:
	MOV 	AH , 00
	MOV	AL , SUBTOTAL
	MUL	CSST1
	DIV	CSST2			

	MOV	SST1 , AL
	MOV	TEMP1 , AL
	ADD	SST1 , 30H
	MOV	SST2 , AH
	ADD	SST2 , 30H

	;---------------------------

	MOV	AL , SST2
	MOV	DX , 0
	MOV	BX , 10			
	DIV	BX
						; use to retrieve first decimal point
	MOV	R1 , AH
	ADD	R1 , 30H
	MOV	R2 , AL
	ADD	R2 , 30H

	;----------------------------

	MOV	AL , SST2
	MOV	DX , 0
	MOV	BX , 10
	DIV	BX
						; use to retrieve second decimal point
	MOV	R3 , AH
	ADD	R3 , 30H			; e.g. 1 --> "1"
	MOV	R4 , AL
	ADD	R4 , 30H			; e.g. 1 --> "1"

	;---------------------------

	MOV	AH , 09H
	LEA	DX , TTAX			; display TTAX (Tax       : RM)
	INT 	21H

	MOV 	AH , 02H
	MOV	DL , SST1			; display quotient store in SST1
	INT 	21h

	MOV	AH , 02H
	MOV	DL , DOT			; display DOT (.)
	INT 	21H

	MOV 	AH , 02H
	MOV	DL , R1				; display quotient store in R1
	INT 	21h

	MOV 	AH , 02H
	MOV	DL , R3				; display quotient store in R3
	INT 	21h

	MOV	AH , 02H
     	MOV	DL , 0DH
     	INT	21H				; go to new line
     	MOV	DL , 0AH	
     	INT	21H

	MOV	AH , 09H
	LEA	DX , TOTAL1			; display TOTAL1 (Total	  : RM)
	INT 	21H

	MOV	AL , SUBTOTAL			; move SUBTOTAL to AL
	ADD	AL , TEMP1			; add TEMP1
	MOV	TOTAL , AL
	
	;----------------------Convert num to string and display it out----------------------

	MOV 	AH , 00
	MOV 	AL , TOTAL
	MOV 	CX , 10
	XOR 	BX , BX 			; count the pushes

DIVIDE1:
	XOR 	DX , DX
	DIV	CX
	PUSH 	DX 				; DL is a digit in range [0..9]
	INC 	BX 				; Count it

	TEST 	AX , AX
	JNZ 	DIVIDE1 			; AX is not zero - so, continue...
						
	MOV 	CX , BX				; Now POP them all using BX as a counter
	LEA 	SI , RTOTAL 			; DS:SI points to your buffer

GET_DIGIT1:
	POP 	AX
	ADD 	AL , '0' 			; make it ASCII

	MOV 	[SI] , AL			; save it in the buffer
	INC 	SI

	LOOP 	GET_DIGIT1

	MOV 	AL , '$'			; Store '$' to use with Func. 9h Int 21h
	MOV  	[SI] , AL

	MOV 	AH , 09H
	LEA 	DX , RTOTAL			; display STROUTPUT
	INT 	21H

	;----------------------------------

	MOV	AH , 02H
	MOV	DL , DOT			; display DOT (.)
	INT 	21H

	MOV 	AH , 02H
	MOV	DL , R1				; display quotient store in R1
	INT 	21h

	MOV 	AH , 02H
	MOV	DL , R3				; display quotient store in R3
	INT 	21h	

	MOV	AH , 02H
     	MOV	DL , 0DH
     	INT	21H				; go to new line 
	MOV	DL , 0AH	
     	INT	21H

	MOV	AH , 09H
	LEA	DX , RLINE1			; display RLINE1 (Break Line)
	INT 	21H

	MOV	AH , 09H
	LEA	DX , RTHANK			; display RTHANK (Thank you)
	INT 	21H

	MOV	AH , 02H
     	MOV	DL , 0DH
     	INT	21H				; go to new line
	MOV	DL , 0AH	
     	INT	21H

	MOV	AH , 09H
	LEA	DX , RCLOSE			; display RCLOSE (Closing Line)
	INT 	21H
	JMP	EXIT			; jump to EXIT (to avoid the ORDERED(s) and infinite looping)

; ------------------------------------------  Display Ordered Food Name and Quantity -----------------------------------------
; Only displayed if food quantity >1

ORDERED1:
	MOV	AH , 09H
	LEA	DX , ORDNAME1			; display ORDNAME1 Ordered Food Name 1
	INT 	21H

	MOV	AH , 09H
	LEA	DX , ORDQTY1			; display ORDQTY1 (Ordered Food Quantity 1)
	INT	21H
	JMP	CHECK2			; jump back to CHECK2

ORDERED2:
	MOV	AH , 09H
	LEA	DX , ORDNAME2			; display ORDNAME2 (Ordered Food Name 2)
	INT 	21H

	MOV	AH , 09H
	LEA	DX , ORDQTY2			; display ORDQTY2 (Ordered Food Quantity 2)
	INT	21H
	JMP	CHECK3			; jump back to CHECK3

ORDERED3:
	MOV	AH , 09H
	LEA	DX , ORDNAME3			; display ORDNAME3 (Ordered Food Name 3) 
	INT 	21H

	MOV	AH , 09H
	LEA	DX , ORDQTY3			; display ORDQTY3 (Ordered Food Quantity 3)
	INT	21H
	JMP	CHECK4			; jump back to CHECK4

ORDERED4:
	MOV	AH , 09H
	LEA	DX , ORDNAME4			; display ORDNAME4 (Ordered Food Name 4)
	INT 	21H

	MOV	AH , 09H
	LEA	DX , ORDQTY4			; display ORDQTY4 (Ordered Food Quantity 4)
	INT	21H
	JMP	CHECK5			; jump back to CHECK5

ORDERED5:
	MOV	AH , 09H
	LEA	DX , ORDNAME5			; display ORDNAME5 (Ordered Food Name 5)
	INT 	21H

	MOV	AH , 09H
	LEA	DX , ORDQTY5			; display ORDQTY5 (Ordered Food Quantity 5)
	INT	21H
	JMP	CHECK6			; jump back to CHECK6

ORDERED6:
	MOV	AH , 09H
	LEA	DX , ORDNAME6			; display ORDNAME6 (Ordered Food Name 6)
	INT 	21H

	MOV	AH , 09H
	LEA	DX , ORDQTY6			; display ORDQTY6 (Ordered Food Quantity 6)
	INT	21H
	JMP	DONE			; jump back to DONE
 
; ---------------------------------------------------------------------------------------------------------------- Exit -----------------------------------------------------------------------------------------------------------------
	
EXIT:
	MOV	AX , 4C00H			; request for proper exit
	INT	21H	

	MAIN ENDP				; end of entire program

END 	MAIN					; end of program