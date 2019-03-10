
_nec_remote_read:

;NEC IR Receiver PIC12F675.c,11 :: 		short nec_remote_read() {
;NEC IR Receiver PIC12F675.c,13 :: 		unsigned long count = 0, i;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,15 :: 		while ((IR_PIN == 0) && (count < 180)) {
L_nec_remote_read0:
	BTFSC      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read1
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read47
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read47
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read47
	MOVLW      180
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read47:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read1
L__nec_remote_read45:
;NEC IR Receiver PIC12F675.c,16 :: 		count++;
	MOVF       nec_remote_read_count_L0+0, 0
	MOVWF      R0+0
	MOVF       nec_remote_read_count_L0+1, 0
	MOVWF      R0+1
	MOVF       nec_remote_read_count_L0+2, 0
	MOVWF      R0+2
	MOVF       nec_remote_read_count_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      nec_remote_read_count_L0+0
	MOVF       R0+1, 0
	MOVWF      nec_remote_read_count_L0+1
	MOVF       R0+2, 0
	MOVWF      nec_remote_read_count_L0+2
	MOVF       R0+3, 0
	MOVWF      nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,17 :: 		delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_nec_remote_read4:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read4
;NEC IR Receiver PIC12F675.c,18 :: 		}
	GOTO       L_nec_remote_read0
L_nec_remote_read1:
;NEC IR Receiver PIC12F675.c,20 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,22 :: 		while (IR_PIN && (count < 90)) {
L_nec_remote_read5:
	BTFSS      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read6
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read48
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read48
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read48
	MOVLW      90
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read48:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read6
L__nec_remote_read44:
;NEC IR Receiver PIC12F675.c,23 :: 		count++;
	MOVF       nec_remote_read_count_L0+0, 0
	MOVWF      R0+0
	MOVF       nec_remote_read_count_L0+1, 0
	MOVWF      R0+1
	MOVF       nec_remote_read_count_L0+2, 0
	MOVWF      R0+2
	MOVF       nec_remote_read_count_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      nec_remote_read_count_L0+0
	MOVF       R0+1, 0
	MOVWF      nec_remote_read_count_L0+1
	MOVF       R0+2, 0
	MOVWF      nec_remote_read_count_L0+2
	MOVF       R0+3, 0
	MOVWF      nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,24 :: 		delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_nec_remote_read9:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read9
;NEC IR Receiver PIC12F675.c,25 :: 		}
	GOTO       L_nec_remote_read5
L_nec_remote_read6:
;NEC IR Receiver PIC12F675.c,28 :: 		for (i = 0; i < 32; i++) {
	CLRF       R5+0
	CLRF       R5+1
	CLRF       R5+2
	CLRF       R5+3
L_nec_remote_read10:
	MOVLW      0
	SUBWF      R5+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read49
	MOVLW      0
	SUBWF      R5+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read49
	MOVLW      0
	SUBWF      R5+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read49
	MOVLW      32
	SUBWF      R5+0, 0
L__nec_remote_read49:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read11
;NEC IR Receiver PIC12F675.c,29 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,30 :: 		while ((IR_PIN == 0) && (count < 15)) {
L_nec_remote_read13:
	BTFSC      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read14
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read50
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read50
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read50
	MOVLW      15
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read50:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read14
L__nec_remote_read43:
;NEC IR Receiver PIC12F675.c,31 :: 		count++;
	MOVF       nec_remote_read_count_L0+0, 0
	MOVWF      R0+0
	MOVF       nec_remote_read_count_L0+1, 0
	MOVWF      R0+1
	MOVF       nec_remote_read_count_L0+2, 0
	MOVWF      R0+2
	MOVF       nec_remote_read_count_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      nec_remote_read_count_L0+0
	MOVF       R0+1, 0
	MOVWF      nec_remote_read_count_L0+1
	MOVF       R0+2, 0
	MOVWF      nec_remote_read_count_L0+2
	MOVF       R0+3, 0
	MOVWF      nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,32 :: 		delay_us(30);
	MOVLW      9
	MOVWF      R13+0
L_nec_remote_read17:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read17
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,33 :: 		}
	GOTO       L_nec_remote_read13
L_nec_remote_read14:
;NEC IR Receiver PIC12F675.c,34 :: 		if ( (count > 14) || (count < 2))     // NEC protocol?
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read51
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read51
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read51
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      14
L__nec_remote_read51:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read42
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read52
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read52
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read52
	MOVLW      2
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read52:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read42
	GOTO       L_nec_remote_read20
L__nec_remote_read42:
;NEC IR Receiver PIC12F675.c,35 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read20:
;NEC IR Receiver PIC12F675.c,37 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,38 :: 		while (IR_PIN && (count < 30)) {
L_nec_remote_read21:
	BTFSS      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read22
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read53
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read53
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read53
	MOVLW      30
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read53:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read22
L__nec_remote_read41:
;NEC IR Receiver PIC12F675.c,39 :: 		count++;
	MOVF       nec_remote_read_count_L0+0, 0
	MOVWF      R0+0
	MOVF       nec_remote_read_count_L0+1, 0
	MOVWF      R0+1
	MOVF       nec_remote_read_count_L0+2, 0
	MOVWF      R0+2
	MOVF       nec_remote_read_count_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      nec_remote_read_count_L0+0
	MOVF       R0+1, 0
	MOVWF      nec_remote_read_count_L0+1
	MOVF       R0+2, 0
	MOVWF      nec_remote_read_count_L0+2
	MOVF       R0+3, 0
	MOVWF      nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,40 :: 		delay_us(30);
	MOVLW      9
	MOVWF      R13+0
L_nec_remote_read25:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read25
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,41 :: 		}
	GOTO       L_nec_remote_read21
L_nec_remote_read22:
;NEC IR Receiver PIC12F675.c,42 :: 		if ( (count > 29) || (count < 4))     // NEC protocol?
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read54
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read54
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read54
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      29
L__nec_remote_read54:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read40
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read55
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read55
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read55
	MOVLW      4
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read55:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read40
	GOTO       L_nec_remote_read28
L__nec_remote_read40:
;NEC IR Receiver PIC12F675.c,43 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read28:
;NEC IR Receiver PIC12F675.c,45 :: 		if ( count > 20)                      // If space width > 1ms
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read56
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read56
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read56
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      20
L__nec_remote_read56:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read29
;NEC IR Receiver PIC12F675.c,46 :: 		ir_code |= 1ul << (31 - i);         // Write 1 to bit (31 - i)
	MOVLW      31
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       R5+0, 0
	SUBWF      R0+0, 1
	MOVF       R5+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R5+1, 0
	SUBWF      R0+1, 1
	MOVF       R5+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R5+2, 0
	SUBWF      R0+2, 1
	MOVF       R5+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R5+3, 0
	SUBWF      R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	MOVF       R4+0, 0
L__nec_remote_read57:
	BTFSC      STATUS+0, 2
	GOTO       L__nec_remote_read58
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__nec_remote_read57
L__nec_remote_read58:
	MOVF       R0+0, 0
	IORWF      _ir_code+0, 1
	MOVF       R0+1, 0
	IORWF      _ir_code+1, 1
	MOVF       R0+2, 0
	IORWF      _ir_code+2, 1
	MOVF       R0+3, 0
	IORWF      _ir_code+3, 1
	GOTO       L_nec_remote_read30
L_nec_remote_read29:
;NEC IR Receiver PIC12F675.c,48 :: 		ir_code &= ~(1ul << (31 - i));      // Write 0 to bit (31 - i)
	MOVLW      31
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       R5+0, 0
	SUBWF      R0+0, 1
	MOVF       R5+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R5+1, 0
	SUBWF      R0+1, 1
	MOVF       R5+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R5+2, 0
	SUBWF      R0+2, 1
	MOVF       R5+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R5+3, 0
	SUBWF      R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	MOVF       R4+0, 0
L__nec_remote_read59:
	BTFSC      STATUS+0, 2
	GOTO       L__nec_remote_read60
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__nec_remote_read59
L__nec_remote_read60:
	COMF       R0+0, 1
	COMF       R0+1, 1
	COMF       R0+2, 1
	COMF       R0+3, 1
	MOVF       R0+0, 0
	ANDWF      _ir_code+0, 1
	MOVF       R0+1, 0
	ANDWF      _ir_code+1, 1
	MOVF       R0+2, 0
	ANDWF      _ir_code+2, 1
	MOVF       R0+3, 0
	ANDWF      _ir_code+3, 1
L_nec_remote_read30:
;NEC IR Receiver PIC12F675.c,28 :: 		for (i = 0; i < 32; i++) {
	MOVF       R5+0, 0
	MOVWF      R0+0
	MOVF       R5+1, 0
	MOVWF      R0+1
	MOVF       R5+2, 0
	MOVWF      R0+2
	MOVF       R5+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R5+0
	MOVF       R0+1, 0
	MOVWF      R5+1
	MOVF       R0+2, 0
	MOVWF      R5+2
	MOVF       R0+3, 0
	MOVWF      R5+3
;NEC IR Receiver PIC12F675.c,49 :: 		}
	GOTO       L_nec_remote_read10
L_nec_remote_read11:
;NEC IR Receiver PIC12F675.c,50 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
;NEC IR Receiver PIC12F675.c,51 :: 		}
L_end_nec_remote_read:
	RETURN
; end of _nec_remote_read

_main:

;NEC IR Receiver PIC12F675.c,53 :: 		void main()
;NEC IR Receiver PIC12F675.c,55 :: 		ANSEL       = 0x00;                        //Digital IOs only
	CLRF       ANSEL+0
;NEC IR Receiver PIC12F675.c,56 :: 		CMCON       = 0x07;                        //Disables comparators
	MOVLW      7
	MOVWF      CMCON+0
;NEC IR Receiver PIC12F675.c,57 :: 		TRISIO      = 0x08;                        //GP3 are input, others are output
	MOVLW      8
	MOVWF      TRISIO+0
;NEC IR Receiver PIC12F675.c,58 :: 		OPTION_REG  = 0x80;                        //Disable pull-ups
	MOVLW      128
	MOVWF      OPTION_REG+0
;NEC IR Receiver PIC12F675.c,59 :: 		LED_PIN = 1;
	BSF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,60 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,61 :: 		LED_PIN = 0;
	BCF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,62 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,64 :: 		while (1) { //Loop executed infinite times
L_main33:
;NEC IR Receiver PIC12F675.c,66 :: 		if (nec_remote_read()) {
	CALL       _nec_remote_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main35
;NEC IR Receiver PIC12F675.c,67 :: 		address = ir_code >> 16;
	MOVF       _ir_code+2, 0
	MOVWF      R0+0
	MOVF       _ir_code+3, 0
	MOVWF      R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       R0+0, 0
	MOVWF      _address+0
	MOVF       R0+1, 0
	MOVWF      _address+1
;NEC IR Receiver PIC12F675.c,68 :: 		command = ir_code >> 8;
	MOVF       _ir_code+1, 0
	MOVWF      R0+0
	MOVF       _ir_code+2, 0
	MOVWF      R0+1
	MOVF       _ir_code+3, 0
	MOVWF      R0+2
	CLRF       R0+3
	MOVF       R0+0, 0
	MOVWF      _command+0
;NEC IR Receiver PIC12F675.c,70 :: 		switch (command) {
	GOTO       L_main36
;NEC IR Receiver PIC12F675.c,71 :: 		case 0x68:
L_main38:
;NEC IR Receiver PIC12F675.c,72 :: 		LED_PIN = 1;
	BSF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,73 :: 		break;
	GOTO       L_main37
;NEC IR Receiver PIC12F675.c,74 :: 		case 0x30:
L_main39:
;NEC IR Receiver PIC12F675.c,75 :: 		LED_PIN = 0;
	BCF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,76 :: 		break;
	GOTO       L_main37
;NEC IR Receiver PIC12F675.c,77 :: 		}
L_main36:
	MOVF       _command+0, 0
	XORLW      104
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVF       _command+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main39
L_main37:
;NEC IR Receiver PIC12F675.c,78 :: 		}
L_main35:
;NEC IR Receiver PIC12F675.c,79 :: 		}
	GOTO       L_main33
;NEC IR Receiver PIC12F675.c,80 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
