locals
dseg segment
   mokshim  db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
			db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
			db  0,0,0,0,0,0,0,0,0 ; המערך הראשי 
	
  openblocs db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
			db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
            db  0,0,0,0,0,0,0,0,0
			db  0,0,0,0,0,0,0,0,0	; מערך הדגלים והמשבצות הפתוחות
	
 prerandoms db 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; המערך שממנו יוצרים את מקומות המוקשים במשחק
	randoms db	0,0,0,0,0,0,0,0,0,0 ; המערך שמכיל את מקומות המוקשים במשחק

	PRN					dw 	?	; "משתנה בשימוש "מחולל מספרים פסאודו אקראיים
    welcome_msg 		db  'Welcome To Minesweeper! press "Space" to start the game$' 
	minesleft_msg		db	'Mines Left To Find: $' 
	minesleftdelete_msg db  '                      $'
	Lose_msg			db	'Game Over :( $' 
	Win_msg				db	'Sweet Victory !!$'	
	
	Minesleft			db  10 	; מוקשים שנשארו במשחק
	mokeshison			db	0  	; משתנה שמראה על הפסד 
	nomokeshonS			db	0 	; משתנה 
    mishbetsetWidth     dw  35	; אורך כל משבצת בלוח המשחק 
    mishbetsetHeight    dw  35 	; גובה כל משבצת בלוח המשחק	
	x					dw	160 ; ערך האיקס שממנו מתחיל ציור הלוח 
	y					dw	75	; ערך הווי שממנו מתחיל ציור הלוח
	copyX				dw	160	; משתנה עזר 
	copyY				dw  75	; משתנה עזר
	copyX2				dw	?	; משתנה עזר
	copyY2				dw  ?	; משתנה עזר
    shuraLength         dw  ?	; כמה משבצות בכל שורה בשביל ציור הלוח בתחילת המשחק 
    amudaLength         dw  ?	; כמה משבצות בכל עמודה בשביל ציור הלוח בתחילת המשחק
	cursorAmuda			db	0	; מציג את העמודה של הסמן ברגע זה 	
	copycursorAmuda		db	0	; משתנה עזר 
	cursorShura			db	0	; מציג את השורה של הסמן ברגע זה 
	copycursorShura		db	0 	; משתנה עזר 
	cursorX				dw	0  	; ערך האיקס של הסמן 
	cursorY				dw 	0	; ערך הווי של הסמן 
	cursorLength		db	15 	; אורך הסמן 
	;cursorSetY			db 	? 	; 
	cursorColor			db  1   ; צבע רקע הסמן 
	cursorColor1		db  7 	; צבע הסמן 
	copycursorColor		db 	7	; משתנה עזר 
	copyrand			db	?	; משתנה עזר בקביעת מקומי המוקשים 
	CheL				db  0	; משתנה המראה אם בעמודה הנוכחית יש צד שמאל
	CheR				db  0	; משתנה המראה אם בעמודה הנוכחית יש צד ימין 
	CheU				db 	0	; משתנה המראה אם בשורה הנוכחית יש צד עליון
	CheD				db  0	; משתנה המראה אם בשורה הנוכחית יש צד תחתון
	Copydi				dw	? 	; משתנה עזר
	Copydi2				dw	?	; משתנה עזר
	Copysi				dw  ? 	; משתנה עזר
	copyax 				dw	0 	; משתנה עזר
	copybx				dw	0	; משתנה עזר
	Copybh				db	? 	; משתנה עזר
	copybh2				db	?	; משתנה עזר
	copycx				dw	0	; משתנה עזר
	copydx				dw	0	; משתנה עזר
	Row					dw  9 	;
	Row_Plus			dw  100	;
	Row_Minus			dw 	100	;
	Col					dw  1 	;
	Col_Plus			dw  100	;
	Col_Minus			dw  100	;
	counter				db  0	; משתנה המראה כמה מקומי דגלים נכונים
	currentX			dw	?	; איקס הנוכחי 
	currentY			dw	? 	; ווי הנוכחי 
	currentX2			dw 	?	; משתנה עזר
	currentY2			dw	?	; משתנה עזר 
	colorA				db	7	; צבע רקע הדמות
	colorb				db	0	; צבע הדמות
	copycolorA			db	7	; משתנה עזר
	copycolorB			db  0	; משתנה עזר
	boolean				db	?	; משתנה המראה אם יש אפשרות לשים דגל נוסף
	
Startbloc	db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 
			db	255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30
			db	255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 
			db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255
			db	30 , 255 , 30 , 255 , 30 , 255 , 254	; משבצת ריקה או סגורה
			
	one		db 	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 10 , 10 , 10 , 255 , 10 , 10 , 10 , 255 , 8
			db	12 , 10 , 255 , 8 , 12 , 10 , 255 , 7 , 13 , 10 , 255 , 7 , 13 , 10 , 255 , 6
			db	14 , 10 , 255 , 6 , 14 , 10 , 255 , 11 , 9 , 10 , 255 , 11 , 9 , 10 , 255 , 11
			db	9 , 10 , 255 , 11 , 9 , 10 , 255 , 11 , 9 , 10 , 255 , 11 , 9 , 10 , 255 , 11
			db	9 , 10 , 255 , 11 , 9 , 10 , 255 , 11 , 9 , 10 , 255 , 11 , 9 , 10 , 255 , 11
			db	9 , 10 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6
			db	18 , 6 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 254 ; פריסה של הספרה 1
	

	two		db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 7 , 15 , 8
			db	255 , 6 , 17 , 7 , 255 , 6 , 17 , 7 , 255 , 6 , 4 , 8 , 5 , 7 , 255 , 18 , 5 , 7 
			db	255 , 18 , 5 , 7 , 255 , 18 , 5 , 7 , 255 , 18 , 5 , 7 , 255 , 18 , 5 , 7 , 255
			db	16 , 7 , 7 , 255 , 14 , 8 , 8 , 255 , 12 , 7 , 11 , 255 , 12 , 6 , 12 , 255 
			db	10 , 7 , 13 , 255 , 10 , 6 , 14 , 255 , 8 , 7 , 15 , 255 , 7 , 8 , 15 , 255
			db	6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 30
			db	255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 254	; פריסה של הספרה 2	
	
	three	db 	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 6 , 17 , 7 , 255 , 6 , 18
			db	6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 22 , 3 , 5 , 255 , 22 , 3  
			db	5 , 255 , 22 , 3 , 5 , 255 , 22 , 3 , 5 , 255 , 22 , 3 , 5 , 255 , 8 , 16
			db	6 , 255 , 8 , 16 , 6 , 255 , 8 , 16 , 6 , 255 , 8 , 16 , 6 , 255 , 22 , 3 
			db	5 , 255 , 22 , 3 , 5 , 255 , 22 , 3 , 5 , 255 , 22 , 3 , 5 , 255 , 22 , 3 , 5 , 255 , 6
			db	18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 17 , 7 , 255 
			db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 254	; פריסה של הספרה 3
			
	four	db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 6 , 5 , 8 , 5 , 6 , 255
			db	6 , 5 , 8 , 5 , 6 , 255 , 6 , 5 , 8 , 5 , 6 , 255 , 6 , 5 , 8 , 5 , 6 , 255 , 6
			db	5 , 8 , 5 , 6 , 255 , 6 , 5 , 8 , 5 , 6 , 255 , 6 , 5 , 8 , 5 , 6 , 255 , 6
			db	5 , 8 , 5 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 
			db	6 , 18 , 6 , 255 , 19 , 5 , 6 , 255 , 19 , 5 , 6 , 255 , 19 , 5 , 6 , 255 , 19
			db	5 , 6 , 255 , 19 , 5 , 6 , 255 , 19 , 5 , 6 , 255 , 19 , 5 , 6 , 255 , 19 , 5
			db	6 , 255 , 19 , 5 , 6 , 255 , 19 , 5 , 6 , 255 , 30 , 255 , 30 , 255 , 30 , 255 
			db	30 , 255 , 30 , 255 , 254 		; פריסה של הספרה 4
	
	five	db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 
			db	6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 5 , 19 , 255 , 6 , 5 , 19 , 255 , 6 , 5 
			db	19 , 255 , 6 , 5 , 19 , 255 , 6 , 5 , 19 , 255 , 6 , 5 , 19 , 255 , 6 , 17 , 7 , 255 
			db	6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 19 , 5 , 6 , 255 , 19 , 5  
			db	6 , 255 , 19 , 5 , 6 , 255 , 19 , 5 , 6 , 255 , 19 , 5 , 6 , 255 , 6 , 18 , 6 , 255  
			db	6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 6 , 18 , 6 , 255 , 30 , 255 , 30 , 255 , 30 , 255 
			db	30 , 255 , 30 , 255 , 254 	; פריסה של הספרה 5
	
	six		db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 6 , 19 , 5 , 255 , 6 , 19 , 5 , 255 
			db	6 , 19 , 5 , 255 , 6 , 19 , 5 , 255 , 6 , 4 , 20 , 255 , 6 , 4 , 20 , 255 , 6 , 4 
			db	20 , 255 , 6 , 4 , 20 , 255 , 6 , 4 , 20 , 255 , 6 , 19 , 5 , 255 , 6 , 19 , 5 , 255 
			db	6 , 19 , 5 , 255 , 6 , 19 , 5 , 255 , 6 , 3 , 13 , 3 , 5 , 255 , 6 , 3 , 13 , 3 , 5 
			db	255 , 6 , 3 , 13 , 3 , 5 , 255 , 6 , 3 , 13 , 3 , 5 , 255 , 6 , 3 , 13 , 3 , 5 , 255 
			db	6 , 19 , 5 , 255 , 6 , 19 , 5 , 255 , 6 , 19 , 5 , 255 , 6 , 19 , 5
			db	255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 254	 
			
	Mine	db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 12 , 6 , 12 , 255 , 12 , 6 , 12 , 255
			db	5 , 2 , 2 , 12 , 2 , 2 , 5 , 255 , 5 , 2 , 2 , 12 , 2 , 2 , 5 , 255 , 8 , 14
			db	8 , 255 , 8 , 14 , 8 , 255 , 4 , 23 , 3 , 255 , 4 , 23 , 3 , 255 , 4 , 23 , 3
			db	255 , 4 , 23 , 3 , 255 , 1 , 28 , 1 , 255 , 1 , 28 , 1 , 255 , 1 , 28 , 1
			db	255 , 1 , 28 , 1 , 255 , 4 , 23 , 3 , 255 , 4 , 23 , 3 , 255 , 4 , 23 , 3 , 255
			db	4 , 23 , 3 , 255 , 8 , 14 , 8 , 255 , 8 , 14 , 8 , 255 , 5 , 2 , 2 , 12 , 2 , 2
			db	5 , 255 , 5 , 2 , 2 , 12 , 2 , 2 , 5 , 255 , 12 , 6 , 12 , 255 , 12 , 6 , 12 
			db	255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 254	; פריסה של מוקש
	
	Flag	db	30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 5 , 20 , 5 , 255 , 5 , 20 , 5 , 255 
			db	5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255
			db	5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 
			db	6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5
			db	6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 
			db	8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 , 20 , 5 , 255 , 5 , 20 , 5 , 255
			db	5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255 , 5 , 6 , 8 , 6 , 5 , 255, 5 
			db	20 , 5 , 255 , 5 , 20 , 5 , 255 , 30 , 255 , 30 , 255 , 30 , 255 , 30 , 255 ; פריסה של דגל
			db	30 , 255 , 254		

dseg ends
cseg segment
assume ds:dseg, cs:cseg

DrawDmoot	proc		; fun which draw dmoot depends on X and Y that are holding the place, and SI which holding the dmoot
				mov ax, y
				mov currentY, ax	; מיקום השורה של הציור
				mov ax, x
				mov currentX, ax	; מיקום העמודה של הציור

	NewRow:		mov cx, currentX
				mov dx, currentY ; העברה לאוגרים

	NextAtRow:	mov bl, ds:[si] ;  הלולאה בודקת אם המיקוו הנוכחי אינו סוף שורה או סוף דמות
				inc si 
				cmp bl, 254
				jz SofDmoot
				cmp bl, 0
				jz NoColorA
				cmp bl, 255
				jz IncY
				mov bh, 0
				mov al, colorA
				mov ah, 0ch
	PutPixelA:	int 10h ; לולאה שמדפיסה שורה מרקע הדמות
				inc cx
				dec bl
				jnz PutPixelA

	NoColorA:	mov bl, ds:[si] ; לולאה שבודקת אם המיקום הנוכחי אינו סוף שורה או סוף דמות
				inc si
				cmp bl, 254
				jz SofDmoot
				cmp bl, 255
				jz IncY
				mov al, colorb
				mov ah, 0ch
	PutPixelB:	int 10h ; לולאה שמדפיסה שורה מהדמות
				inc cx
				dec bl
				jnz PutPixelB
				jmp NextAtRow

	IncY:		inc currentY ; ירידת שורה
				mov ax, x
				mov currentX, ax
				jmp newRow
	SofDmoot:	ret ; סיום
DrawDmoot	endp

				
DrawCursor	proc
			push ax bx cx dx
			mov ax,	currentX
			mov bl,	cursorAmuda
			add ax, 15
@@CursorSetX:	cmp bl, 0
			jz @@SetCursorX
			add ax,	mishbetsetWidth
			dec bl
			jmp @@CursorSetX
@@SetCursorX:	mov cursorX,	ax
			mov ax,	currentY
			mov bl,	cursorShura
			inc bl
			add ax,	23
@@CursorSetY:	cmp bl,	0
			jz @@SetCursorY
			add ax,	mishbetsetHeight
			dec bl
			jmp @@CursorSetY
@@SetCursorY:	mov cursorY,	ax
			
			mov cx, cursorX
			mov dx, cursorY
			mov bl, cursorLength
			mov bh, 0
			mov al, cursorColor
			mov ah, 0ch
@@PutPixel:	int 10h
			inc cx
			dec bl
			jnz @@PutPixel
			pop dx cx bx ax
			ret
DrawCursor	endp

DelCursor	proc
			push ax bx cx dx 
			
			mov ax,	currentX
			mov bl,	cursorAmuda
			add ax, 15
@@CursorSetX2:	cmp bl, 0
			jz @@SetCursorX2
			add ax,	mishbetsetWidth
			dec bl
			jmp @@CursorSetX2
@@SetCursorX2:	mov cursorX,	ax
			
			mov ax,	currentY
			mov bl,	cursorShura
			inc bl
			add ax,	23
@@CursorSetY2:	cmp bl,	0
			jz @@SetCursorY2
			add ax,	mishbetsetHeight
			dec bl
			jmp @@cursorSetY2
@@SetCursorY2:	mov cursorY,	ax
			
			mov cx, cursorX
			mov dx, cursorY
			mov bl, cursorLength
			mov bh, 0
			mov al, cursorColor1
			mov ah, 0ch
@@PutPixel2:	int 10h
			inc cx
			dec bl
			jnz @@PutPixel2
			pop dx cx bx ax
			ret
DelCursor	endp


NewRandom 	proc
		mov     ax, 25173
		mul     word ptr [PRN]
		add     ax, 13849
		mov     [PRN], ax
		ret 
NewRandom 	endp
	
	
RandomMines		proc 
				push ax
				push bx
				push cx
				push dx 
			
			
			mov 	si,0	
			mov 	ax,	2 
			MOV 	AH, 00h   ; interrupt to get system timer in CX:DX 
			INT 	1AH
			mov     [PRN], dx
 preRandom:	call    NewRandom   ; -> AX is a random number
			xor     dx, dx
			mov     cx, 10    
			div     cx        ; here dx contains the remainder - from 0 to 9  
			;dl=0-9 
			mov 	ax,	si 
			mov		bl, 2
			div		bl 
			mov		bl, ah  
			cmp		bl, 0 
			jnz		EZugi		
	Zugi:	cmp 	dl,9 
			jz		preRandom 
			cmp		dl,0 
			jnz		If8
			inc		nomokeshonS 
			jmp		PutpreRandoms	
	If8:	cmp		dl,8 
			jnz		PutpreRandoms
			inc		di
			cmp		bh,1 
			jz		preRandom
			inc		bh 
			jmp		PutpreRandoms 
   EZugi:	cmp		nomokeshonS,1 
			jnz		ifdi1 
			cmp		dl,0 
			jnz		Decs
			jmp		preRandom
	Decs:	dec		nomokeshonS 
	ifdi1:	cmp 	di,1 
			jnz		PutpreRandoms 
			mov 	dl,0 
			dec		di					
PutpreRandoms: mov 	[prerandoms+si] ,dl    
			inc   	si 
			cmp   	si,20
			jnz 	preRandom  
			
			mov si,0 
			mov di,0 
			
  Random:	mov 	ax,	si 
			mov		bl, 2
			div		bl 
			mov		bl, ah  
			mov		ah, 0
			cmp		bl, 0 
			jnz		Ahadot
  Asarot:	mov	 	al, [prerandoms+si] 
			mov	 	bl, 10  
			mul  	bl 
			mov   	copyrand,al 
			jmp		incsi 
  Ahadot:	mov		al, copyrand 
			mov		bl, [prerandoms+si]
			add		al, bl 
			mov 	[randoms+di], al 
			inc 	di 
   incsi:	inc 	si 
			cmp 	si,20 
			jnz 	Random 

				pop ax
				pop bx
				pop cx
				pop dx
				
				ret
RandomMines 	endp		
		
		
PUT_M_IN_AR 	proc 
			push ax
			push bx
			push cx
			push dx
		
			mov si,0 
			mov dl,1
PutMokshim:	mov al, [randoms+si] 
			mov di, ax 
			mov bl, [mokshim+di]
			cmp bl , 9 
			jnz PutMreg 
			cmp al,dl 
			jc	compare2
  compare1: cmp al, dl 
			jz compare2 
			mov ax,di 
			sub al,dl 
			mov di,ax 
			cmp [mokshim+di], 9
			jnz PutM
			inc dl 
			jmp	compare1  
 compare2:	mov ax, di 
			add al,dl 
			mov di,ax 
			cmp [mokshim+di] , 9 
			jnz	PutM
			inc dl 
			jmp compare2 
     PutM:	mov [mokshim+di], 9
			mov dl,1
			jmp CheckE 
  PutMreg:	mov [mokshim+di], 9 
   CheckE:	inc si 
			cmp si,10 
			jnz PutMokshim 
			
			pop ax
			pop bx
			pop cx
			pop dx
			
				ret 
PUT_M_IN_AR 	endp			
			
	
Calc_Board_M	proc 
				push ax
				push bx
				push dx
				push cx
				
	CalcM:	mov CheU, 0
			mov CheL, 0 
			mov CheR, 0 
			mov CheD, 0 
			mov Col_Minus,100
			mov Row_Minus,100 
			mov Col_Plus,100 
			mov Row_Plus,100  
			mov Copydi, di 
			mov Copysi, si
			add di,si
			mov al, [mokshim+di] 
			mov di,Copydi 
			mov si,Copysi
			;si=Col , di=Row
			cmp al, 9 
			jz CheckU
			jmp	EndCalc
   CheckU:	cmp di, 0 
			jnz CheckL 
			mov CheU,1
   CheckL:	cmp si,	0
			jnz CheckD 
			mov CheL,1
   CheckD:  cmp di, 72
			jnz CheckR  
			mov CheD,1 
   CheckR:  cmp si, 8 
			jnz C1
			mov CheR,1  
			
	  C1:	mov dl, CheU 
			cmp dl,	1
			jz 	C2
			sub di,Row
			mov Row_Minus, di 
			add di,si 
			cmp [mokshim+di], 9
			jz  C2
			mov al, [mokshim+di] 
			inc al 
			mov [mokshim+di], al 
			jmp C2 
			
	  C2:	mov di, Copydi 
			mov si, Copysi		  
			mov dl,CheL 
			cmp dl, 1
			jz  C3
			sub si,Col 
			mov Col_Minus, si
			add si,di  
			cmp [mokshim+si], 9
			jz C3
			mov al,[mokshim+si] 
			inc al 
			mov [mokshim+si], al 
			jmp C3	
			
	  C3:	mov si, Copysi 
			mov di, Copydi
			mov dl, CheD 
			cmp dl, 1
			jz C4
			add di,Row
			mov Row_Plus, di			
			add di,si 
			cmp [mokshim+di], 9
			jz C4
			mov al, [mokshim+di] 
			inc al 
			mov [mokshim+di], al 
			jmp C4
			
	  C4:	mov di, Copydi 
			mov si, Copysi
			mov dl, CheR 
			cmp dl, 1
			jz C5
			add si,Col 
			mov Col_Plus, si
			add si,di 
			cmp [mokshim+si], 9 
			jz C5
			mov al, [mokshim+si] 
			inc al 
			mov [mokshim+si], al  
			jmp C5
			
	  C5:	mov si, Copysi 
			mov di, Row_Minus 
			cmp di,	100 
			jz	C6
			mov si, Col_Minus 
			cmp si, 100 
			jz	C6
			add di,si 
			cmp [mokshim+di], 9 
			jz  C6
			mov dl, [mokshim+di] 
			inc dl 
			mov [mokshim+di], dl 
			jmp C6	
			
	  C6:	mov si, copysi 
			mov di,	copydi 
			mov di, Row_Minus 
			cmp di,	100 
			jz	C7
			mov si, Col_Plus 
			cmp si, 100 
			jz	C7
			add di,si 
			cmp [mokshim+di], 9 
			jz  C7
			mov dl, [mokshim+di] 
			inc dl 
			mov [mokshim+di], dl
			jmp C7
			
	  C7:	mov si, copysi 
			mov di,	copydi 
			mov di, Row_Plus 
			cmp di,	100 
			jz	C8
			mov si, Col_Plus 
			cmp si, 100 
			jz	C8
			add di,si 
			cmp [mokshim+di], 9 
			jz  C8
			mov dl, [mokshim+di] 
			inc dl 
			mov [mokshim+di], dl 
			jmp C8
			
	  C8:	mov si, copysi 
			mov di,	copydi 
			mov di, Row_Plus 
			cmp di,	100 
			jz	EndCalc
			mov si, Col_Minus
			cmp si, 100 
			jz	EndCalc
			add di,si 
			cmp [mokshim+di], 9 
			jz  Endcalc
			mov dl, [mokshim+di] 
			inc dl 
			mov [mokshim+di], dl
			jmp EndCalc
			
 EndCalc:	mov si, copysi 
			mov di, copydi 
			inc si
			cmp si,9 
			jz  ConEndC
			jmp CalcM
 ConEndC:	add di,9 
			mov si,0 
			cmp di,81 
			jz SofC 
			jmp	CalcM
	
	SofC:	
			pop ax
			pop bx
			pop dx
			pop cx
			ret
Calc_Board_M	endp 	
	
	
RecEmptyBlocks	proc 
				
				cmp  	[mokshim+di], 0 
				jnz   	SofRec  
				cmp	 	[openblocs+di],2 
				jz	  	SofRec	
				mov 	[mokshim+di],10
				mov 	al,cursorShura 
				mov 	ah,cursorAmuda 
		C11:	cmp		al,0 
				jz  	C12
				sub		di,9
				dec		al 
				mov 	cursorShura,al 
				call	RecEmptyBlocks 
				add		di,9 
				inc		al 
				mov 	cursorShura,al	
		C12:	cmp 	ah,0 
				jz 		C13
				dec		di
				dec 	ah 
				mov		cursorAmuda,ah 
				call	RecEmptyBlocks 
				inc 	di
				inc		ah 
				mov 	cursorAmuda,ah
		C13:	cmp 	al,8
				jz 		C14
				add 	di,9
				inc		al 
				mov 	cursorShura,al 
				call	RecEmptyBlocks  
				sub		di,9 
				dec		al 
				mov 	cursorShura,al	
		C14:	cmp		ah,8 
				jz 		SofRec
				inc		di
				inc 	ah 
				mov 	cursorAmuda,ah 
				call	RecEmptyBlocks 	
				dec 	di
				dec		ah 
				mov 	cursorAmuda,ah
				
	  SofRec:	
				ret
RecEmptyBlocks 	endp 

NearEmptyBlocks proc 
				push di 
				push ax 
				push si 
				push bx	
				 	
				
				mov ax,0 
				mov di,0 
	Nearloop:   mov Col_Minus,100
				mov Row_Minus,100 
				mov Col_Plus,100 
				mov Row_Plus,100 
				mov bl, [mokshim+di]
				cmp bl, 10
				jz Checkifflag 
				jmp endNear
   Checkifflag:	cmp [openblocs+di],2 
				jnz	CheckRightNear 
				jmp endNear
CheckRightNear:	cmp al,8 
				jz  CheckLeftNear 
				mov Copydi2, di 
				inc di 
				mov si, di 
				mov di,Copydi2
				mov Col_Plus, si 				
				cmp	[openblocs+si], 2 
				jz	CheckLeftNear
				cmp [mokshim+si], 9 
				jnc  CheckLeftNear
				mov bh, [mokshim+si] 
				add bh,10 
				mov [mokshim+si],bh 
CheckLeftNear:	cmp al,0 
				jz  CheckUpNear
				mov Copydi2, di 
				dec di 
				mov si, di 
				mov di,Copydi2 
				mov Col_Minus,si 
				cmp	[openblocs+si], 2 
				jz	CheckUpNear
				cmp [mokshim+si], 9 
				jnc CheckUpNear
				mov bh,[mokshim+si] 
				add bh,10
				mov [mokshim+si],bh 
  CheckUpNear:	cmp ah, 0 
				jz  CheckDownNear
				mov Copydi2, di 
				sub di,9 
				mov si, di 
				mov di,Copydi2 
				mov Row_Minus, si
				cmp	[openblocs+si], 2 
				jz	CheckDownNear
				cmp [mokshim+si],9 
				jnc  CheckDownNear
				mov bh,[mokshim+si] 
				add bh,10
				mov [mokshim+si],bh  
CheckDownNear:	cmp ah,8 
				jz  CheckSlant1 
				mov Copydi2, di 
				add di,9 
				mov si, di 
				mov di,Copydi2 
				mov Row_Plus, si
				cmp	[openblocs+si], 2 
				jz	CheckSlant1
				cmp [mokshim+si],9 
				jnc  CheckSlant1
				mov bh,[mokshim+si] 
				add bh,10
				mov [mokshim+si],bh 
  CheckSlant1:	cmp	Col_Minus,100 
				jz	CheckSlant2
				cmp Row_Minus,100
				jz 	CheckSlant2
				mov	si,Row_Minus 
				dec si
				cmp	[openblocs+si], 2 
				jz	CheckSlant2
				cmp [mokshim+si],9 
				jnc CheckSlant2 
				mov bh,[mokshim+si] 
				add bh,10
				mov [mokshim+si],bh 
  CheckSlant2:	cmp	Col_Minus,100 
				jz  CheckSlant3
				cmp Row_Plus,100 
				jz 	CheckSlant3
				mov	si,Row_Plus 
				dec si 
				cmp	[openblocs+si], 2 
				jz	CheckSlant3
				cmp [mokshim+si],9 
				jnc CheckSlant3 
				mov bh,[mokshim+si] 
				add bh,10
				mov [mokshim+si],bh 
  CheckSlant3:	cmp	Col_Plus,100 
				jz	CheckSlant4
				cmp Row_Minus,100
				jz 	CheckSlant4
				mov	si,Row_Minus 
				inc si
				cmp	[openblocs+si], 2 
				jz	CheckSlant4
				cmp [mokshim+si],9 
				jnc CheckSlant4 
				mov bh,[mokshim+si] 
				add bh,10
				mov [mokshim+si],bh 
  CheckSlant4:	cmp	Col_Plus,100 
				jz  endNear
				cmp Row_Plus,100 
				jz 	endNear
				mov	si,Row_Plus 
				inc si 
				cmp	[openblocs+si], 2 
				jz	endNear
				cmp [mokshim+si],9 
				jnc endNear 
				mov bh,[mokshim+si] 
				add bh,10
				mov [mokshim+si],bh 				
	  endNear:  inc di 
				cmp di,81 
				jz SofNear
				inc al 
				cmp al,9 
				jz newline 
				jmp Nearloop
	 newline:	inc ah 
				mov al,0 
				jmp Nearloop
				
	  SofNear:  pop di
				pop ax
				pop si
				pop bx 
				
				ret
NearEmptyBlocks endp

DrawEmptyBlocks	proc 
				push ax
				push bx
				push cx
				push dx 
					
				mov di,0 
				mov bh,0
				mov cx,copyX
				mov dx,copyY	
	PrintLoop:	cmp [openblocs+di],2 
				jnz  BeCheckifone	
				jmp Con
 BeCheckifone:  cmp	[mokshim+di], 10 
				jnz Checkifone
				mov	si, offset Startbloc 	
				jmp Drawblock 
   Checkifone: 	cmp [mokshim+di], 11
				jnz Checkiftwo
				mov si, offset one 
				mov colorb, 1
				jmp Drawblock  
   Checkiftwo: 	cmp [mokshim+di],12 
				jnz Checkifthree 
				mov si, offset two  
				mov colorb, 2
				jmp Drawblock 
 Checkifthree:	cmp [mokshim+di],13 
				jnz Checkiffour 
				mov si, offset three 
				mov colorb, 4
				jmp Drawblock	
  Checkiffour:	cmp [mokshim+di],14 
				jnz Checkiffive 
				mov si, offset four 
				mov colorb, 9
				jmp Drawblock	
  Checkiffive:	cmp [mokshim+di],15 
				jnz Checkifsix 
				mov si, offset five 
				mov colorb, 6
				jmp Drawblock 
   Checkifsix:	cmp [mokshim+di],16 
				jnz Con 
				mov si, offset six 
				mov colorb, 3
				jmp Drawblock 					
	Drawblock:	mov [openblocs+di],1
				mov	 x,cx 
				mov  y,dx  
				mov  Copybh,bh
				call DrawDmoot 
				mov  cx,x 
				mov  dx,y 
				mov  bh,Copybh
		  Con:	inc	 bh
				inc  di  
				cmp	 bh,9
				jnz	 SecondCheck	 
				add	 dx,mishbetsetHeight 
				mov  bh,0 
				mov  cx,copyX 
				jmp  FinCheck	
  SecondCheck:	add	 cx,mishbetsetWidth		
	 FinCheck:	cmp  di,81 
				jz  FinishLoop 
				jmp PrintLoop	
				
					
   FinishLoop:	pop	 ax
				pop	 bx
				pop  cx
				pop  dx 
				
				ret
DrawEmptyBlocks endp				


OpenBoard	proc ; פתיחת כל המשבצות בלוח 
				push 	ax
				push 	bx
				push 	cx
				push 	dx 
				
				 ;מחיקת הודעה קודמת
				mov		ah, 2
				mov 	bh, 0
				mov 	dh, 25 ;שורה
				mov 	dl, 30 ;עמודה
				int 	10h	
				mov 	dx, offset minesleft_msg
				mov		ah , 9
				int		21h   
				mov 	dx,0 
				mov 	ax,0 
				mov 	cx,0 
				mov		bx,0 
				
				mov 	ax,	di 
				mov		di,0   
				mov 	copyX, 160 
				mov		copyY, 75 
				
				mov		cx, 160 
				mov 	dx, 75 
	openLoop:	mov		bl, [mokshim+di] 
				mov		x, 	cx 
				mov		y, 	dx 
				mov		copyax, ax  
				mov		copybx, bx 
				mov		copycx, cx
				mov		copydx, dx 
	
	ifFlagis:	cmp		[openblocs+di], 2 
				jnz  	ifMokeshis
				mov		si, offset Flag
				cmp		[mokshim+di],	9 
				jz		Posti
	   Negat:	mov		colorA, 7 
				mov		colorb, 4 
				call	DrawDmoot
				jmp		presiumLoop 
	   Posti:	mov		colorA, 7 
				mov 	colorb, 14 
				call	DrawDmoot 
				jmp		presiumLoop 
  ifMokeshis:	cmp		[mokshim+di], 9 
				jnz 	IfEmpty
				mov		si, offset Mine
				cmp		di,ax 
				jnz 	AnoM
	    CurM:	mov		colorA, 4
				mov		colorb, 0
				call	DrawDmoot 
				jmp 	presiumLoop 
		AnoM:	mov		colorA,	8
				mov		colorb, 0 
				call	DrawDmoot 
				jmp		presiumLoop 
	  IfEmpty:	cmp		[mokshim+di],0 
				jnz		IfNum1 
				mov		colorA,8 
				mov		si, offset Startbloc 
				call	DrawDmoot 	
				jmp		presiumLoop		
	  IfNum1:  	cmp 	[mokshim+di], 1 
				jnz		IfNum2
				mov		colorA,8 
				mov 	colorb,1 
				mov 	si, offset one 
				call	DrawDmoot 
				jmp 	presiumLoop
	  IfNum2:	cmp 	[mokshim+di], 2  
				jnz		IfNum3
				mov		colorA,8 
				mov 	colorb,2 
				mov 	si, offset two 
				call	DrawDmoot 
				jmp 	presiumLoop
	  IfNum3:	cmp 	[mokshim+di], 3 
				jnz		IfNum4
				mov		colorA,8 
				mov 	colorb,4 
				mov 	si, offset three 
				call	DrawDmoot 
				jmp 	presiumLoop 	 
	  IfNum4:	cmp		[mokshim+di],	4	
				jnz 	IfNum5 
				mov		colorA,8 
				mov		colorb,9 
				mov 	si, offset four 
				call	DrawDmoot 
				jmp 	presiumLoop	
	  IfNum5:	cmp		[mokshim+di],	5	
				jnz 	IfNum6 
				mov		colorA,8 
				mov		colorb,6 
				mov 	si, offset five
				call	DrawDmoot 
				jmp 	presiumLoop	
	  IfNum6:	cmp		[mokshim+di],	6	
				jnz 	presiumLoop 
				mov		colorA,8 
				mov		colorb,3 
				mov 	si, offset six
				call	DrawDmoot 
				jmp 	presiumLoop					
 presiumLoop:	mov		ax,	copyax 
				mov		bx,	copybx
				mov		cx,	copycx
				mov		dx,	copydx			
				inc		bh 
				inc 	di 
				
				cmp		di,81
				jz 		endopen
				cmp		bh,9
				jnz		Con3
				add		dx, mishbetsetHeight 
				mov		cx,	copyX  
				mov 	bh,0 
				jmp		openLoop 
		Con3:	add		cx,mishbetsetWidth 
				jmp		openLoop 
				
	 endopen:	;mov		di, ax
				pop  	ax
				pop	 	bx
				pop  	cx
				pop		dx
				
				
				ret 
OpenBoard	endp 
			
DrawOpenBloc 	proc 

				mov		cx, x 
				mov 	dx, y 
				mov		bl, cursorAmuda 
isCurrentAmuda:	cmp 	bl, 0 
				jz 		BeforeCheck	
				add 	cx,mishbetsetWidth
				dec 	bl 
				jmp		isCurrentAmuda	 
   BeforeCheck: mov 	bl,cursorShura 				
isCurrentShura:	cmp 	bl,0 
				jz 		Hacfala
				add		dx,mishbetsetHeight 
				dec		bl 
				jmp 	isCurrentShura 
	   Hacfala: mov 	copyax, ax
				mov 	ax,0	
				mov 	al, cursorShura 
				mov 	bl, 9 
				mul 	bl 
				add		al, cursorAmuda 
				mov		di, ax  
				mov 	bl,[mokshim+di] 
				mov		ax, currentX 
				mov 	currentX2, ax 	
				mov 	ax, currentY  
				mov 	currentY2,ax 
				mov 	ax, x 
				mov 	copyX, ax 	
				mov 	ax, y 
				mov 	copyY, ax 
				mov 	ax,copyax
				mov 	x, cx
				mov 	y, dx 
				cmp		[openblocs+di],2 
				jnz		Simun
				jmp		Sium
	   Simun:	mov		[openblocs+di], 1
CheckIfEmpty:	cmp 	bl,0 
				jnz 	CheckIfMokesh  
				mov		ah,cursorAmuda 
				mov		al,cursorShura 
				mov 	copycursorAmuda,ah 
				mov		copycursorShura,al 
				mov 	ax,copyax 
				mov 	copydi, di
				call	RecEmptyBlocks 
				call	NearEmptyBlocks
				mov		bl,0
				mov		ah,copycursorAmuda 
				mov 	al,copycursorShura 
				mov		cursorAmuda,ah 
				mov 	cursorShura,al 
				mov		di,copydi 
				mov		colorA,8
				call	DrawEmptyBlocks 
				mov		di,copydi
				jmp 	Sium	
CheckIfMokesh:	cmp		bl, 9 
				jnz 	CheckIfNum1   
				call	OpenBoard
				mov		mokeshison, 1
				jmp 	Sium
  CheckIfNum1:  cmp 	bl, 1 
				jnz		CheckIfNum2
				mov		colorA,8 
				mov 	colorb,1 
				mov 	si, offset one
				call	DrawDmoot 
				jmp 	Sium
  CheckIfNum2:	cmp 	bl, 2  
				jnz		CheckIfNum3
				mov		colorA,8 
				mov 	colorb,2 
				mov 	si, offset two 
				call	DrawDmoot 
				jmp 	Sium 
  CheckIfNum3:	cmp 	bl, 3 
				jnz		CheckIfNum4
				mov		colorA,8 
				mov 	colorb,4 
				mov 	si, offset three 
				call	DrawDmoot 
				jmp 	Sium 	 
  CheckIfNum4:	cmp		bl,	4	
				jnz 	CheckIfNum5 
				mov		colorA,8 
				mov		colorb,9 
				mov 	si, offset four 
				call	DrawDmoot
				jmp 	Sium				
  CheckIfNum5:	cmp		bl,	5	
				jnz 	CheckIfNum6 
				mov		colorA,8 
				mov		colorb,6 
				mov 	si, offset five
				call	DrawDmoot 
				jmp		Sium	
  CheckIfNum6:	cmp		bl,	6	
				jnz 	Sium 
				mov		colorA,8 
				mov		colorb,3 
				mov 	si, offset six
				call	DrawDmoot				
		 Sium:	mov 	al, copycolorA  
				mov		colorA, al 
				mov 	al, copycolorB 
				mov 	colorb, al 				
				mov		ax,	copyX 
				mov		x, ax 
				mov 	ax,	copyY 
				mov 	y, ax 
				mov 	ax, currentX2 
				mov 	currentX, ax 
				mov 	ax, currentY2 
				mov 	currentY, ax 
				mov		ax, copyax   
				
				ret 
DrawOpenBloc	endp 	

BeforeDelCur	proc
				mov 	ax,0	
				mov 	al, cursorShura 
				mov 	bl, 9 
				mul 	bl 
				add		al, cursorAmuda 
				mov		di, ax  
				mov 	bl,[openblocs+di] 
				cmp 	bl, 1 
				jnz		SofBeforeDel 
				mov 	cursorColor1, 8  
				
SofBeforeDel:	ret 
BeforeDelCur	endp						

	
PutFlagHere		proc
				mov		ax,0 
				mov		boolean,0 	
				mov 	al, cursorShura 
				mov 	bl, 9 
				mul 	bl 
				add		al, cursorAmuda 
				mov		di, ax  
				cmp		[openblocs+di],1 
				jz 		endputflag 
				cmp		[openblocs+di],2 
				jnz  	check2
				mov		[openblocs+di],0 
				jmp 	endputflag
	  check2:	cmp		Minesleft, 0 
				jnz		conputflag 
				mov		boolean,1 
				jmp 	endputflag
  conputflag:	mov		[openblocs+di],2 
	  
  endputflag:	ret 
PutFlagHere		endp   


DrawFlag		proc 
				mov		cx, x 
				mov 	dx, y 
				mov		bl, cursorAmuda 
  isCurAmuda:	cmp 	bl, 0 
				jz 		Bcheck
				add 	cx,mishbetsetWidth
				dec 	bl 
				jmp		isCurAmuda	 
      BCheck: 	mov 	bl,cursorShura 				
  isCurShura:	cmp 	bl,0 
				jz 		Placedi
				add		dx,mishbetsetHeight 
				dec		bl 
				jmp 	isCurShura 
	 Placedi: 	mov 	copyax, ax
				mov 	ax,0	
				mov 	al, cursorShura 
				mov 	bl, 9 
				mul 	bl 
				add		al, cursorAmuda 
				mov		di, ax  
				mov		ax, currentX 
				mov 	currentX2, ax 	
				mov 	ax, currentY  
				mov 	currentY2,ax 
				mov 	ax, x 
				mov 	copyX, ax 	
				mov 	ax, y 
				mov 	copyY, ax 
				mov 	ax,copyax
				mov 	x, cx
				mov 	y, dx  
				cmp		[openblocs+di],1 
				jz		EndDrawFlag
	 Addflag:	cmp		[openblocs+di],2 
				jnz		Dellflag
				mov 	colorA,7 
				mov 	colorb,14 
				mov 	si, offset Flag 
				call	DrawDmoot 
				dec		Minesleft 
				jmp 	EndDrawFlag
	Dellflag:	mov		colorA,7 
				mov		colorb,0 
				mov 	si, offset Startbloc 
				call	DrawDmoot  
				cmp		boolean,1 
				jz		EndDrawFlag
				inc		Minesleft 
 EndDrawFlag:	mov 	al, copycolorA  
				mov		colorA, al 
				mov 	al, copycolorB 
				mov 	colorb, al 				
				mov		ax,	copyX 
				mov		x, ax 
				mov 	ax,	copyY 
				mov 	y, ax 
				mov 	ax, currentX2 
				mov 	currentX, ax 
				mov 	ax, currentY2 
				mov 	currentY, ax 
				mov		ax, copyax  
					
				ret 
DrawFlag		endp				
				
CheckWinBoard	proc ; בדיקה אם יש נצחון, אם יש נצחון המשתנה קאונטר יהיה 10 אחרת אין
				
				push ax 
				
				mov		di,0 
				mov		counter,0 
	 winLoop:	mov 	al,[mokshim+di] 
				cmp 	al,9 
				jnz 	siumwin
				cmp		[openblocs+di],2 
				jnz 	siumwin
				inc 	counter 
	 siumwin:	inc 	di
				cmp		di,81 
				jz		endwin 
				jmp		winLoop 
	
	  endwin:	pop	ax
				ret
CheckWinBoard	endp				

ShowMinesLeft	proc ; הדפסת הודעה שמראה על כמה מוקשים נותרו לשים במשחק
				push ax
				push bx
				push cx
				push dx 
				
				mov		ah, 2
				mov 	bh, 0
				mov 	dh, 25 ;שורה
				mov 	dl, 30 ;עמודה
				int 	10h	 
				mov		dx, offset minesleftdelete_msg 
				mov		ah , 9
				int		21h   
				; מחיקת הודעה קודמת
				mov		ah, 2
				mov 	bh, 0
				mov 	dh, 25 ;שורה
				mov 	dl, 30 ;עמודה
				int 	10h	
				mov 	dx, offset minesleft_msg
				mov		ah , 9
				int		21h  
				; הדפסת הודעה מחדש
				cmp	 	Minesleft,10 
				jnz  	Noten
				mov 	dl, 1 
				add 	dl,'0'
				mov 	ah, 2
				int 	21h 
				mov 	dl,0 
				add 	dl,'0'
				mov 	ah,2
				int 	21h
				jmp 	Siumshow
				; אם המשתנה של המוקשים הנותרים שווה ל10 תדפיס 1 ואז 0
		Noten:	mov 	dl,Minesleft  
				add 	dl,'0'
				mov 	ah,2 
				int 	21h  
				; אחרת, תדפיס את המשתנה של המוקשים הנותרים
Siumshow:		pop 	ax bx cx dx 
				ret 
ShowMinesLeft	endp				

Drawarrayboard	proc 
				push ax bx cx dx 
				mov		ah, 2
				mov 	bh, 0
				mov 	dh, 10 ;שורה
				mov 	dl, 88 ;עמודה
				int 	10h	
				mov 	di,0 
				mov		bl,0
	arrayloop:	mov		dl,[mokshim+di] 
				add		dl,'0' 
				mov		ah,2 
				int		21h 
				inc 	di 
				inc 	bl 
				cmp		bl,9 
				jnz		Conarrayloop 
				mov		bh,0 
				inc		dh 
				mov		dl,88 
				int		10h 
				mov		bl,0
 Conarrayloop:	cmp		di,81 
				jnz		arrayloop 
				
				pop	ax bx cx dx 
				ret 
Drawarrayboard	endp

					
	Start:	mov ax,dseg
            mov ds,ax
            mov ah, 0
            mov al, 12h
            int 10h
			call RandomMines
			call PUT_M_IN_AR
			mov dx, 0
			mov si, 0
			mov di,	0
			call Calc_Board_M 
			mov bx,	0
			mov bp,	mishbetsetWidth
			mov di, 0
			mov shuraLength,9 
			mov	amudaLength,9 
			
DrawChar:	mov si, offset Startbloc ; לולאה שמדפיסה את כל הלוח 
			mov copybx, bx
			call DrawDmoot
			mov bx,	copybx
			inc di
			add x, bp
			cmp di, shuraLength
			jnz DrawChar
			mov di,	0
			inc bx
			mov x, 160
			add y, bp 
			cmp bx, amudaLength
			jnz DrawChar
			mov ah, 7
			int 21h 
			
BeforeCursor:			
			mov currentX, 153 ; מיקום הסמן 
			mov currentY, 45
			mov ax, copyX 
			mov	x, ax 
			mov ax, copyY 
			mov y, ax 
			mov ax,0
			
SetCursor:	call 	DrawCursor
			call	ShowMinesLeft
			;call	Drawarrayboard
			cmp		Minesleft, 0 
			jnz		ConKelet 
			call	CheckWinBoard 
			cmp		counter,10 
			jnz		ConKelet 
			call	OpenBoard
			jmp 	PrintWin
 ConKelet:	mov 	ah, 7	;	1
	Kelet:	int 	21h		;	al <=== Asci code
			cmp 	al, 27	;	Esc Ascii code - 27
			jnz 	CheckRight 
			jmp 	Sof
			
	CheckRight:		
			cmp 	al, 'd' 
			jnz 	CheckDown 
			cmp		cursorAmuda,8
			jnc		SetCursor
			
			mov 	copyax, ax 
			call	BeforeDelCur 
			mov		ax ,copyax
			call 	DelCursor 
			mov 	al, copycursorColor
			mov		cursorColor1, al 
			mov 	ax,copyax
			inc 	cursorAmuda 
			jmp 	SetCursor
	CheckDown:
			cmp 	al, 's'  
			jnz 	CheckLeft
			cmp		cursorShura,8
			jnc		SetCursor
			
			mov 	copyax, ax 
			call	BeforeDelCur 
			mov		ax ,copyax
			call 	DelCursor 
			mov 	al, copycursorColor
			mov		cursorColor1, al 
			mov 	ax,copyax
			inc 	cursorShura
			jmp 	SetCursor 
	
   PreSetCur: jmp SetCursor
	
	CheckLeft:
			cmp 	al, 'a' 
			jnz 	CheckUp 
			cmp		cursorAmuda,1 
			jnc 	MovLeft
			jmp		SetCursor
	MovLeft:mov 	copyax, ax 
			call	BeforeDelCur 
			mov		ax ,copyax
			call 	DelCursor 
			mov 	al, copycursorColor
			mov		cursorColor1, al 
			mov 	ax,copyax
			dec 	cursorAmuda
			jmp 	SetCursor 
	
	CheckUp:
			cmp 	al, 'w' 
			jnz 	CheckFlag
			cmp 	cursorShura, 1
			jc		PreSetCur
			
			mov 	copyax, ax 
			call	BeforeDelCur 
			mov		ax ,copyax
			call 	DelCursor 
			mov 	al, copycursorColor
			mov		cursorColor1, al 
			mov 	ax,copyax
			dec 	cursorShura
			jmp 	SetCursor

  CheckFlag:	
			cmp		al, 'n' 
			jnz 	CheckOpenButton 
			mov 	copyax, ax 
			call	PutFlagHere 
			mov		ax, copyax 
			call	DrawFlag 
			jmp		SetCursor		
				
CheckOpenButton:
			cmp 	al,	'm' 
			jz		Con2 
			jmp 	Kelet 
	Con2:	mov 	copyax, ax 
			call 	DrawOpenBloc
			mov		ax, copyax
			cmp		mokeshison,1	
			jz 		PrintLose
			jmp		SetCursor
			
			
PrintLose:	
			mov		ah, 2
			mov 	bh, 0
			mov 	dh, 25 ;שורה
			mov 	dl, 30 ;עמודה
			int 	10h	 
			mov		dx, offset minesleftdelete_msg 
			mov		ah , 9
			int		21h  
			
			mov		ah, 2
			mov 	bh, 0
			mov 	dh, 25 ;שורה
			mov 	dl, 34 ;עמודה
			int 	10h		
			mov 	dx, offset Lose_msg
			mov		ah , 9
			int		21h 
			jmp		WaitClick
			
PrintWin:	
			mov		ah, 2
			mov 	bh, 0
			mov 	dh, 25 ;שורה
			mov 	dl, 30 ;עמודה
			int 	10h	 
			mov		dx, offset minesleftdelete_msg 
			mov		ah , 9
			int		21h   
			
			mov		ah, 2
			mov 	bh, 0
			mov 	dh, 25 ;שורה
			mov 	dl, 34 ;עמודה
			int 	10h		
			mov 	dx, offset Win_msg
			mov		ah , 9
			int		21h 
			jmp		WaitClick
			
WaitClick:
			MOV		ah , 7
			INT		21h
			cmp 	al, 27
			jz		Sof
			jmp 	WaitClick
			
			
Sof:    int 3h
cseg 	ends
end     Start  



			















			
			
			
			

			
    
