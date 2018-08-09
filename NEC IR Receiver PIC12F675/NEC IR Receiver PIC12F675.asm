
_nec_remote_read:

;NEC IR Receiver PIC12F675.c,9 :: 		short nec_remote_read() {
;NEC IR Receiver PIC12F675.c,11 :: 		unsigned long count = 0, i;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,13 :: 		while ((IR_PIN == 0) && (count < 180)) {
L_nec_remote_read0:
	BTFSC      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read1
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
	MOVLW      180
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read55:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read1
L__nec_remote_read53:
;NEC IR Receiver PIC12F675.c,14 :: 		count++;
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
;NEC IR Receiver PIC12F675.c,15 :: 		delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_nec_remote_read4:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read4
;NEC IR Receiver PIC12F675.c,16 :: 		}
	GOTO       L_nec_remote_read0
L_nec_remote_read1:
;NEC IR Receiver PIC12F675.c,17 :: 		if ( (count > 179) || (count < 80))     // NEC protocol?
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
	SUBLW      179
L__nec_remote_read56:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read52
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read57
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read57
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read57
	MOVLW      80
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read57:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read52
	GOTO       L_nec_remote_read7
L__nec_remote_read52:
;NEC IR Receiver PIC12F675.c,18 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read7:
;NEC IR Receiver PIC12F675.c,20 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,22 :: 		while (IR_PIN && (count < 90)) {
L_nec_remote_read8:
	BTFSS      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read9
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read58
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read58
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read58
	MOVLW      90
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read58:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read9
L__nec_remote_read51:
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
L_nec_remote_read12:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read12
;NEC IR Receiver PIC12F675.c,25 :: 		}
	GOTO       L_nec_remote_read8
L_nec_remote_read9:
;NEC IR Receiver PIC12F675.c,26 :: 		if ( (count > 89) || (count < 10))       // NEC protocol?
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read59
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read59
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read59
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      89
L__nec_remote_read59:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read50
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read60
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read60
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read60
	MOVLW      10
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read60:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read50
	GOTO       L_nec_remote_read15
L__nec_remote_read50:
;NEC IR Receiver PIC12F675.c,27 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read15:
;NEC IR Receiver PIC12F675.c,30 :: 		for (i = 0; i < 32; i++) {
	CLRF       R5+0
	CLRF       R5+1
	CLRF       R5+2
	CLRF       R5+3
L_nec_remote_read16:
	MOVLW      0
	SUBWF      R5+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read61
	MOVLW      0
	SUBWF      R5+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read61
	MOVLW      0
	SUBWF      R5+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read61
	MOVLW      32
	SUBWF      R5+0, 0
L__nec_remote_read61:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read17
;NEC IR Receiver PIC12F675.c,31 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,32 :: 		while ((IR_PIN == 0) && (count < 10)) {
L_nec_remote_read19:
	BTFSC      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read20
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read62
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read62
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read62
	MOVLW      10
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read62:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read20
L__nec_remote_read49:
;NEC IR Receiver PIC12F675.c,33 :: 		count++;
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
;NEC IR Receiver PIC12F675.c,34 :: 		delay_us(30);
	MOVLW      9
	MOVWF      R13+0
L_nec_remote_read23:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read23
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,35 :: 		}
	GOTO       L_nec_remote_read19
L_nec_remote_read20:
;NEC IR Receiver PIC12F675.c,36 :: 		if ( (count > 9) || (count < 2))     // NEC protocol?
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read63
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read63
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read63
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      9
L__nec_remote_read63:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read48
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read64
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read64
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read64
	MOVLW      2
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read64:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read48
	GOTO       L_nec_remote_read26
L__nec_remote_read48:
;NEC IR Receiver PIC12F675.c,37 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read26:
;NEC IR Receiver PIC12F675.c,39 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC12F675.c,40 :: 		while (IR_PIN && (count < 30)) {
L_nec_remote_read27:
	BTFSS      GP3_bit+0, BitPos(GP3_bit+0)
	GOTO       L_nec_remote_read28
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read65
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read65
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read65
	MOVLW      30
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read65:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read28
L__nec_remote_read47:
;NEC IR Receiver PIC12F675.c,41 :: 		count++;
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
;NEC IR Receiver PIC12F675.c,42 :: 		delay_us(30);
	MOVLW      9
	MOVWF      R13+0
L_nec_remote_read31:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read31
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,43 :: 		}
	GOTO       L_nec_remote_read27
L_nec_remote_read28:
;NEC IR Receiver PIC12F675.c,44 :: 		if ( (count > 29) || (count < 4))     // NEC protocol?
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read66
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read66
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read66
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      29
L__nec_remote_read66:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read46
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read67
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read67
	MOVLW      0
	SUBWF      nec_remote_read_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read67
	MOVLW      4
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read67:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read46
	GOTO       L_nec_remote_read34
L__nec_remote_read46:
;NEC IR Receiver PIC12F675.c,45 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read34:
;NEC IR Receiver PIC12F675.c,47 :: 		if ( count > 20)                      // If space width > 1ms
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read68
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read68
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read68
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      20
L__nec_remote_read68:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read35
;NEC IR Receiver PIC12F675.c,48 :: 		ir_code |= 1ul << (31 - i);         // Write 1 to bit (31 - i)
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
L__nec_remote_read69:
	BTFSC      STATUS+0, 2
	GOTO       L__nec_remote_read70
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__nec_remote_read69
L__nec_remote_read70:
	MOVF       R0+0, 0
	IORWF      _ir_code+0, 1
	MOVF       R0+1, 0
	IORWF      _ir_code+1, 1
	MOVF       R0+2, 0
	IORWF      _ir_code+2, 1
	MOVF       R0+3, 0
	IORWF      _ir_code+3, 1
	GOTO       L_nec_remote_read36
L_nec_remote_read35:
;NEC IR Receiver PIC12F675.c,50 :: 		ir_code &= ~(1ul << (31 - i));      // Write 0 to bit (31 - i)
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
L__nec_remote_read71:
	BTFSC      STATUS+0, 2
	GOTO       L__nec_remote_read72
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__nec_remote_read71
L__nec_remote_read72:
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
L_nec_remote_read36:
;NEC IR Receiver PIC12F675.c,30 :: 		for (i = 0; i < 32; i++) {
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
;NEC IR Receiver PIC12F675.c,51 :: 		}
	GOTO       L_nec_remote_read16
L_nec_remote_read17:
;NEC IR Receiver PIC12F675.c,52 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
;NEC IR Receiver PIC12F675.c,53 :: 		}
L_end_nec_remote_read:
	RETURN
; end of _nec_remote_read

_main:

;NEC IR Receiver PIC12F675.c,55 :: 		void main()
;NEC IR Receiver PIC12F675.c,57 :: 		ANSEL       = 0x00;                        //Digital IOs only
	CLRF       ANSEL+0
;NEC IR Receiver PIC12F675.c,58 :: 		CMCON       = 0x07;                        //Disables comparators
	MOVLW      7
	MOVWF      CMCON+0
;NEC IR Receiver PIC12F675.c,59 :: 		TRISIO      = 0x08;                        //GP3 are input, others are output
	MOVLW      8
	MOVWF      TRISIO+0
;NEC IR Receiver PIC12F675.c,60 :: 		OPTION_REG  = 0x80;                        //Disable pull-ups
	MOVLW      128
	MOVWF      OPTION_REG+0
;NEC IR Receiver PIC12F675.c,61 :: 		LED_PIN = 1;
	BSF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,62 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,63 :: 		LED_PIN = 0;
	BCF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,64 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
	NOP
;NEC IR Receiver PIC12F675.c,66 :: 		while (1) { //Loop executed infinite times
L_main39:
;NEC IR Receiver PIC12F675.c,68 :: 		if (nec_remote_read()) {
	CALL       _nec_remote_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main41
;NEC IR Receiver PIC12F675.c,69 :: 		address = ir_code >> 16;
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
;NEC IR Receiver PIC12F675.c,70 :: 		command = ir_code >> 8;
	MOVF       _ir_code+1, 0
	MOVWF      R0+0
	MOVF       _ir_code+2, 0
	MOVWF      R0+1
	MOVF       _ir_code+3, 0
	MOVWF      R0+2
	CLRF       R0+3
	MOVF       R0+0, 0
	MOVWF      _command+0
;NEC IR Receiver PIC12F675.c,72 :: 		switch (command) {
	GOTO       L_main42
;NEC IR Receiver PIC12F675.c,73 :: 		case 0x48:
L_main44:
;NEC IR Receiver PIC12F675.c,74 :: 		LED_PIN = 1;
	BSF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,75 :: 		break;
	GOTO       L_main43
;NEC IR Receiver PIC12F675.c,76 :: 		case 0x80:
L_main45:
;NEC IR Receiver PIC12F675.c,77 :: 		LED_PIN = 0;
	BCF        GP2_bit+0, BitPos(GP2_bit+0)
;NEC IR Receiver PIC12F675.c,78 :: 		break;
	GOTO       L_main43
;NEC IR Receiver PIC12F675.c,79 :: 		}
L_main42:
	MOVF       _command+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_main44
	MOVF       _command+0, 0
	XORLW      128
	BTFSC      STATUS+0, 2
	GOTO       L_main45
L_main43:
;NEC IR Receiver PIC12F675.c,80 :: 		}
L_main41:
;NEC IR Receiver PIC12F675.c,81 :: 		}
	GOTO       L_main39
;NEC IR Receiver PIC12F675.c,82 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
