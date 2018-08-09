
_nec_remote_read:

;NEC IR Receiver PIC16F877A.c,26 :: 		short nec_remote_read() {
;NEC IR Receiver PIC16F877A.c,28 :: 		unsigned long count = 0, i;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC16F877A.c,30 :: 		while ((IR_PIN == 0) && (count <= 180)) {
L_nec_remote_read0:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_nec_remote_read1
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read55
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read55
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read55
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      180
L__nec_remote_read55:
	BTFSS      STATUS+0, 0
	GOTO       L_nec_remote_read1
L__nec_remote_read53:
;NEC IR Receiver PIC16F877A.c,31 :: 		count++;
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
;NEC IR Receiver PIC16F877A.c,32 :: 		delay_us(50);
	MOVLW      66
	MOVWF      R13+0
L_nec_remote_read4:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read4
	NOP
;NEC IR Receiver PIC16F877A.c,33 :: 		}
	GOTO       L_nec_remote_read0
L_nec_remote_read1:
;NEC IR Receiver PIC16F877A.c,34 :: 		if ( (count > 179) || (count < 120))     // NEC protocol?
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
	MOVLW      120
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read57:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read52
	GOTO       L_nec_remote_read7
L__nec_remote_read52:
;NEC IR Receiver PIC16F877A.c,35 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read7:
;NEC IR Receiver PIC16F877A.c,37 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC16F877A.c,39 :: 		while (IR_PIN && (count <= 90)) {
L_nec_remote_read8:
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_nec_remote_read9
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read58
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read58
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read58
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      90
L__nec_remote_read58:
	BTFSS      STATUS+0, 0
	GOTO       L_nec_remote_read9
L__nec_remote_read51:
;NEC IR Receiver PIC16F877A.c,40 :: 		count++;
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
;NEC IR Receiver PIC16F877A.c,41 :: 		delay_us(50);
	MOVLW      66
	MOVWF      R13+0
L_nec_remote_read12:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read12
	NOP
;NEC IR Receiver PIC16F877A.c,42 :: 		}
	GOTO       L_nec_remote_read8
L_nec_remote_read9:
;NEC IR Receiver PIC16F877A.c,43 :: 		if ( (count > 89) || (count < 40))       // NEC protocol?
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
	MOVLW      40
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read60:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read50
	GOTO       L_nec_remote_read15
L__nec_remote_read50:
;NEC IR Receiver PIC16F877A.c,44 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read15:
;NEC IR Receiver PIC16F877A.c,47 :: 		for (i = 0; i < 32; i++) {
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
;NEC IR Receiver PIC16F877A.c,48 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC16F877A.c,49 :: 		while ((IR_PIN == 0) && (count <= 23)) {
L_nec_remote_read19:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_nec_remote_read20
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read62
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read62
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read62
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      23
L__nec_remote_read62:
	BTFSS      STATUS+0, 0
	GOTO       L_nec_remote_read20
L__nec_remote_read49:
;NEC IR Receiver PIC16F877A.c,50 :: 		count++;
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
;NEC IR Receiver PIC16F877A.c,51 :: 		delay_us(50);
	MOVLW      66
	MOVWF      R13+0
L_nec_remote_read23:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read23
	NOP
;NEC IR Receiver PIC16F877A.c,52 :: 		}
	GOTO       L_nec_remote_read19
L_nec_remote_read20:
;NEC IR Receiver PIC16F877A.c,53 :: 		if ( (count > 22) || (count < 4))     // NEC protocol?
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
	SUBLW      22
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
	MOVLW      4
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read64:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read48
	GOTO       L_nec_remote_read26
L__nec_remote_read48:
;NEC IR Receiver PIC16F877A.c,54 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read26:
;NEC IR Receiver PIC16F877A.c,56 :: 		count = 0;
	CLRF       nec_remote_read_count_L0+0
	CLRF       nec_remote_read_count_L0+1
	CLRF       nec_remote_read_count_L0+2
	CLRF       nec_remote_read_count_L0+3
;NEC IR Receiver PIC16F877A.c,57 :: 		while (IR_PIN && (count <= 45)) {
L_nec_remote_read27:
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_nec_remote_read28
	MOVF       nec_remote_read_count_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read65
	MOVF       nec_remote_read_count_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read65
	MOVF       nec_remote_read_count_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__nec_remote_read65
	MOVF       nec_remote_read_count_L0+0, 0
	SUBLW      45
L__nec_remote_read65:
	BTFSS      STATUS+0, 0
	GOTO       L_nec_remote_read28
L__nec_remote_read47:
;NEC IR Receiver PIC16F877A.c,58 :: 		count++;
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
;NEC IR Receiver PIC16F877A.c,59 :: 		delay_us(50);
	MOVLW      66
	MOVWF      R13+0
L_nec_remote_read31:
	DECFSZ     R13+0, 1
	GOTO       L_nec_remote_read31
	NOP
;NEC IR Receiver PIC16F877A.c,60 :: 		}
	GOTO       L_nec_remote_read27
L_nec_remote_read28:
;NEC IR Receiver PIC16F877A.c,61 :: 		if ( (count > 44) || (count < 8))     // NEC protocol?
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
	SUBLW      44
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
	MOVLW      8
	SUBWF      nec_remote_read_count_L0+0, 0
L__nec_remote_read67:
	BTFSS      STATUS+0, 0
	GOTO       L__nec_remote_read46
	GOTO       L_nec_remote_read34
L__nec_remote_read46:
;NEC IR Receiver PIC16F877A.c,62 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_nec_remote_read
L_nec_remote_read34:
;NEC IR Receiver PIC16F877A.c,64 :: 		if ( count > 21)                      // If space width > 1ms
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
	SUBLW      21
L__nec_remote_read68:
	BTFSC      STATUS+0, 0
	GOTO       L_nec_remote_read35
;NEC IR Receiver PIC16F877A.c,65 :: 		ir_code |= 1ul << (31 - i);         // Write 1 to bit (31 - i)
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
;NEC IR Receiver PIC16F877A.c,67 :: 		ir_code &= ~(1ul << (31 - i));      // Write 0 to bit (31 - i)
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
;NEC IR Receiver PIC16F877A.c,47 :: 		for (i = 0; i < 32; i++) {
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
;NEC IR Receiver PIC16F877A.c,68 :: 		}
	GOTO       L_nec_remote_read16
L_nec_remote_read17:
;NEC IR Receiver PIC16F877A.c,69 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
;NEC IR Receiver PIC16F877A.c,70 :: 		}
L_end_nec_remote_read:
	RETURN
; end of _nec_remote_read

_main:

;NEC IR Receiver PIC16F877A.c,72 :: 		void main()
;NEC IR Receiver PIC16F877A.c,74 :: 		TRISB0_bit = 1;
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;NEC IR Receiver PIC16F877A.c,75 :: 		TRISC5_bit = 0;
	BCF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
;NEC IR Receiver PIC16F877A.c,76 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;NEC IR Receiver PIC16F877A.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;NEC IR Receiver PIC16F877A.c,78 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;NEC IR Receiver PIC16F877A.c,79 :: 		Lcd_Out(1, 1, "Address:0x0000");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_NEC_32IR_32Receiver_32PIC16F877A+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;NEC IR Receiver PIC16F877A.c,80 :: 		Lcd_Out(2, 1, "Com:0x00 In:0x00");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_NEC_32IR_32Receiver_32PIC16F877A+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;NEC IR Receiver PIC16F877A.c,82 :: 		LED_PIN = 1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;NEC IR Receiver PIC16F877A.c,83 :: 		Delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
;NEC IR Receiver PIC16F877A.c,84 :: 		LED_PIN = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;NEC IR Receiver PIC16F877A.c,85 :: 		Delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
;NEC IR Receiver PIC16F877A.c,87 :: 		while (1) { //Loop executed infinite times
L_main39:
;NEC IR Receiver PIC16F877A.c,90 :: 		if (nec_remote_read()) {
	CALL       _nec_remote_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main41
;NEC IR Receiver PIC16F877A.c,91 :: 		address = ir_code >> 16;
	MOVF       _ir_code+2, 0
	MOVWF      R5+0
	MOVF       _ir_code+3, 0
	MOVWF      R5+1
	CLRF       R5+2
	CLRF       R5+3
	MOVF       R5+0, 0
	MOVWF      _address+0
	MOVF       R5+1, 0
	MOVWF      _address+1
;NEC IR Receiver PIC16F877A.c,92 :: 		command = ir_code >> 8;
	MOVF       _ir_code+1, 0
	MOVWF      R0+0
	MOVF       _ir_code+2, 0
	MOVWF      R0+1
	MOVF       _ir_code+3, 0
	MOVWF      R0+2
	CLRF       R0+3
	MOVF       R0+0, 0
	MOVWF      _command+0
;NEC IR Receiver PIC16F877A.c,93 :: 		inv_command = ir_code;
	MOVF       _ir_code+0, 0
	MOVWF      _inv_command+0
;NEC IR Receiver PIC16F877A.c,94 :: 		IntToHex(address, text);       // Save address in string text with hex format
	MOVF       R5+0, 0
	MOVWF      FARG_IntToHex_input+0
	MOVF       R5+1, 0
	MOVWF      FARG_IntToHex_input+1
	MOVLW      _text+0
	MOVWF      FARG_IntToHex_output+0
	CALL       _IntToHex+0
;NEC IR Receiver PIC16F877A.c,95 :: 		Lcd_Out(1, 11, text);          // Display address
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;NEC IR Receiver PIC16F877A.c,96 :: 		ByteToHex(command, text);      // Save command in string text with hex format
	MOVF       _command+0, 0
	MOVWF      FARG_ByteToHex_input+0
	MOVLW      _text+0
	MOVWF      FARG_ByteToHex_output+0
	CALL       _ByteToHex+0
;NEC IR Receiver PIC16F877A.c,97 :: 		Lcd_Out(2, 7, text);           // Display command
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;NEC IR Receiver PIC16F877A.c,98 :: 		ByteToHex(inv_command, text);  // Save inverted command in string text with hex format
	MOVF       _inv_command+0, 0
	MOVWF      FARG_ByteToHex_input+0
	MOVLW      _text+0
	MOVWF      FARG_ByteToHex_output+0
	CALL       _ByteToHex+0
;NEC IR Receiver PIC16F877A.c,99 :: 		Lcd_Out(2, 15, text);          // Display inverted command
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;NEC IR Receiver PIC16F877A.c,101 :: 		switch (command) {
	GOTO       L_main42
;NEC IR Receiver PIC16F877A.c,102 :: 		case 0x48:
L_main44:
;NEC IR Receiver PIC16F877A.c,103 :: 		LED_PIN = 1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;NEC IR Receiver PIC16F877A.c,104 :: 		break;
	GOTO       L_main43
;NEC IR Receiver PIC16F877A.c,105 :: 		case 0x80:
L_main45:
;NEC IR Receiver PIC16F877A.c,106 :: 		LED_PIN = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;NEC IR Receiver PIC16F877A.c,107 :: 		break;
	GOTO       L_main43
;NEC IR Receiver PIC16F877A.c,108 :: 		}
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
;NEC IR Receiver PIC16F877A.c,109 :: 		}
L_main41:
;NEC IR Receiver PIC16F877A.c,110 :: 		}
	GOTO       L_main39
;NEC IR Receiver PIC16F877A.c,111 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
