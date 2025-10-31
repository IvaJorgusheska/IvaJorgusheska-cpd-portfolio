;Iva Jorgusheska, student ID: 11114620. Last edited on 05.12.2022
;CONVERT TO DECIMAL GAME

;Enjoy my game! It displays a binary number and it is your task to guess the 
;corresponding decimal number! The traffic lights  and a corresponding sound indicate whether 
;your answer was right! If you got it wrong, you still have a chance to try again!
;The game finishes when you press the correct number and there is a song as a reward for you!

;we set the program counter to 0
ORG &0 


;our light sequence starts here
;red, red and amber lights
	LDA R_RA
				STA Trafl
				LDA delay     ;delay
dl1  		SUB one
				JNE dl1
;light red,green
				LDA R_G
				STA Trafl
				LDA delay     ;delay
dl2  		SUB one
				JNE dl2
;light red and amber, red
				LDA RA_R
				STA Trafl
				LDA delay     ;delay
dl3  		SUB one
				JNE dl3
; light green,green
				LDA G_G
				STA Trafl
				LDA delay     ;delay
dl4  		SUB one
				JNE dl4
;light amber,red
				LDA A_R
				STA Trafl
				LDA delay
dl5			SUB one
				JNE dl5
;light red,green
				LDA R_G
				STA Trafl
				LDA delay
dl6			SUB one
				JNE dl6
;light red,red and amber
				LDA R_RA
				STA Trafl
				LDA delay
dl7			SUB one
				JNE dl7
;light green.green
				LDA G_G
				STA Trafl
				LDA delay
dl8			SUB one
				JNE dl8
;light red,green
				LDA R_G
				STA Trafl
				LDA delay
dl9			SUB one
				JNE dl9
;light red and amber,red
    		LDA RA_R
				STA Trafl
				LDA delay
dl10  	SUB one
				JNE dl10
;light green,green
				LDA G_G
				STA Trafl
				LDA delay
dl11		SUB one
				JNE dl11
;light amber,red
				LDA A_R
				STA Trafl
				LDA delay
dl12  	SUB one
				JNE dl12




;game
;1000 displayed on the decoder
;expected input from the player is 8
			LDA no1
			STA Digit3
			LDA no0
			STA Digit0
			LDA no0
			STA Digit2
			LDA no0
			STA Digit1

			LDA delay     ;delay
del		  	SUB one
			JNE del

;checking if the button 8 was pressed on the keyboard
wait
	LDA &FF2
	JNE check 
	JMP wait    ;we wait untill a button is pressed
check	SUB no8
	JNE redlight
	JMP greenligt
			
;if the number entered was wrong, red button is displayed and a low note
redlight 		LDA R_R
			STA Trafl
			LDA delay     ;delay
delay01  		SUB one
			JNE delay01
			LDA no0
			STA Trafl
			LDA cnote
			STA Buzzerinp
			LDA ccnote
			sta Buzzerinp
			LDA cnote
			sta Buzzerinp
			JMP wait         ;the player can try again to guess the number

;if the number entered was correct, green light is displayed and a high note 
greenlight  		LDA G_G
			STA Trafl
			LDA ccnote
			sta Buzzerinp

			LDA delay     ;delay
delay02  		SUB one
			JNE delay02
			LDA ccnote  ;note
			sta Buzzerinp
			LDA delay
delay1      SUB one
			JNE delay1
			LDA no0
			STA Trafl
			LDA ccnote ;note
			sta Buzzerinp
			LDA delay
delay2      SUB one
			JNE delay2

			LDA delay
delay3      SUB one
			JNE delay3








;the song starts here, we load each note and store it to the buzzer with a delay between each

;note d
					 	 LDA d
						STA Buzzerinp
						o_1					LDA Buzzerbsy  ;check if the buzzer is occupied
												JNE o_1
;note f
						LDA f
												STA Buzzerinp
						o_2					LDA Buzzerbsy
												JNE o_2
;note d short
												LDA dshort
												STA Buzzerinp
						o_3 				LDA Buzzerbsy
												JNE o_3
;note d short
												LDA dshort
												STA Buzzerinp
						o_4					LDA Buzzerbsy
												JNE o_4
;note g short
												LDA gshort
												STA Buzzerinp
						o_5					LDA Buzzerbsy
												JNE o_5
;note d
												LDA d
												STA Buzzerinp
						o_6 				LDA Buzzerbsy
												JNE o_6
;note c
												LDA c
												STA Buzzerinp
						o_7					LDA Buzzerbsy
												JNE o_7
;note d
												LDA d
												STA Buzzerinp
						o_8 				LDA Buzzerbsy
												JNE o_8
;note a
												LDA a
												STA Buzzerinp
						o_9					LDA Buzzerbsy
												JNE o_9
; note d short
												LDA dshort
												STA Buzzerinp
						o_10				LDA Buzzerbsy
												JNE o_10
;note d short
												LDA dshort
												STA Buzzerinp
						o_11				LDA Buzzerbsy
												JNE b_11
;note a short sharp
												LDA ashortsharp
												STA Buzzerinp
						o_12				LDA Buzzerbsy
												JNE o_12
;note a
												LDA a
												STA Buzzerinp
						o_13				LDA Buzzerbsy
												JNE o_13
;note f
												LDA f
												STA Buzzerinp
						o_14				LDA Buzzerbsy
												JNE o_14
;note d short                                                                                        
												LDA dshort
												STA Buzzerinp
						o_15				LDA Buzzerbsy
												JNE o_15
;note a sharp
												LDA ashort
												STA Buzzerinp
						o_16				LDA Buzzerbsy
												JNE o_16
;note for high d
												LDA highD
												STA Buzzerinp
						o_17				LDA Buzzerbsy
												JNE o_17
;note d
												LDA d
												STA Buzzerinp
						o_18				LDA Buzzerbsy
												JNE o_18
;note c sharp
												LDA cshort
												STA Buzzerinp
						o_19				LDA Buzzerbsy
												JNE o_19
;note e
												LDA e
												STA Buzzerinp
						o_20				LDA Buzzerbsy
												JNE o_20
;note very long d
												LDA vlongd
												STA Buzzerinp
						o_21				LDA Buzzerbsy
												JNE o_21




;we display the same light sequence from the beginning for the end of the game
LDA R_RA
				STA Trafl
				LDA delay     ;delay
del1  		SUB one
				JNE del1
;light red,green
				LDA R_G
				STA Trafl
				LDA delay     ;delay
del2  		SUB one
				JNE del2
;light red and amber, red
				LDA RA_R
				STA Trafl
				LDA delay     ;delay
del3  		SUB one
				JNE del3
; light green,green
				LDA G_G
				STA Trafl
				LDA delay     ;delay
del4  		SUB one
				JNE del4
;light amber,red
				LDA A_R
				STA Trafl
				LDA delay
del5			SUB one
				JNE del5
;light red,green
				LDA R_G
				STA Trafl
				LDA delay
del6			SUB one
				JNE del6
;light red,red and amber
				LDA R_RA
				STA Trafl
				LDA delay
del7			SUB one
				JNE del7
;light green.green
				LDA G_G
				STA Trafl
				LDA delay
del8			SUB one
				JNE del8
;light red,green
				LDA R_G
				STA Trafl
				LDA delay
del9			SUB one
				JNE del9
;light red and amber,red
    		LDA RA_R
				STA Trafl
				LDA delay
del10  	SUB one
				JNE del10
;light green,green
				LDA G_G
				STA Trafl
				LDA delay
del11		SUB one
				JNE del11
;light amber,red
				LDA A_R
				STA Trafl
				LDA delay
del12  	SUB one
				JNE del12





;memory locations for the elements on the board
no1 				DEFW		0b0001
no2 				DEFW		0b0010
no3 				DEFW		0b0011
no4 				DEFW		0b0100
no5 				DEFW		0b0101
no6 				DEFW		0b0110
no7 				DEFW		0b0111
no8 				DEFW		0b1000
no9 				DEFW		0b1001
no0 				DEFW		0b0000

Digit5  		EQU 	&FFA
Digit4 		EQU 	&FF9
Digit3  		EQU 	&FF8
Digit2 		EQU 	&FF7
Digit1 		EQU 	&FF6
Digit0 		EQU 	&FF5
;  Defining the traffic light states
R_R          DEFW    &24
R_RA         DEFW    &26
R_G   	     DEFW    &21
R_A          DEFW    &22
RA_R         DEFW    &34
G_R          DEFW    &0C
A_R          DEFW    &14
G_G          DEFW    &9

; notes for the buzzing sound
cnote        DEFW &8D40
ccnote       DEFW &844B

;notes for the song
vlongd 			DEFW &8752
c	 		 			DEFW &8350
csharp 			DEFW &8351
d 		 			DEFW &8352
dsharp 			DEFW &8353
e 		 			DEFW &8354
f 	   			DEFW &8355
fsharp 			DEFW &8356
g		 	 			DEFW &8357
gsharp 			DEFW &8358
a    	 			DEFW &8359
asharp 			DEFW &835A
b 		 			DEFW &835B
dshort 			DEFW &8252
gshort 			DEFW &8257
ashort 			DEFW &8259
highD  			DEFW &8262
cshort 			DEFW &8250
ashortsharp DEFW &825A
Trafl 			EQU 	&FFF            ;traffic lights
delay       DEFW    65000  ;defining the delay
one         DEFW    &1     ;one for subtracting
Buzzerbsy		EQU		&FF3
Buzzerinp   EQU		&FFD
