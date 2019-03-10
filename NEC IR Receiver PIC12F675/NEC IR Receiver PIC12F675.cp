#line 1 "D:/microC pro/mikroC pro PIC/NEC IR Receiver PIC12F675/NEC IR Receiver PIC12F675.c"




unsigned long ir_code;
unsigned int address;
unsigned short command, inv_command;

unsigned char i;

short nec_remote_read() {

 unsigned long count = 0, i;

 while (( GP3_bit  == 0) && (count < 180)) {
 count++;
 delay_us(40);
 }

 count = 0;

 while ( GP3_bit  && (count < 90)) {
 count++;
 delay_us(40);
 }


 for (i = 0; i < 32; i++) {
 count = 0;
 while (( GP3_bit  == 0) && (count < 15)) {
 count++;
 delay_us(30);
 }
 if ( (count > 14) || (count < 2))
 return 0;

 count = 0;
 while ( GP3_bit  && (count < 30)) {
 count++;
 delay_us(30);
 }
 if ( (count > 29) || (count < 4))
 return 0;

 if ( count > 20)
 ir_code |= 1ul << (31 - i);
 else
 ir_code &= ~(1ul << (31 - i));
 }
 return 1;
}

void main()
{
 ANSEL = 0x00;
 CMCON = 0x07;
 TRISIO = 0x08;
 OPTION_REG = 0x80;
  GP2_bit  = 1;
 Delay_ms(1000);
  GP2_bit  = 0;
 Delay_ms(1000);

 while (1) {

 if (nec_remote_read()) {
 address = ir_code >> 16;
 command = ir_code >> 8;

 switch (command) {
 case 0x68:
  GP2_bit  = 1;
 break;
 case 0x30:
  GP2_bit  = 0;
 break;
 }
 }
 }
}
