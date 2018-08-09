#line 1 "C:/Users/Minion/Documents/microC pro/NEC IR Receiver PIC16F877A/NEC IR Receiver PIC16F877A.c"

sbit LCD_RS at RD1_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD1_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;






char text[5];
unsigned long ir_code;
unsigned int address;
unsigned short command, inv_command;

short nec_remote_read() {

 unsigned long count = 0, i;

 while (( RB0_bit  == 0) && (count <= 180)) {
 count++;
 delay_us(50);
 }
 if ( (count > 179) || (count < 120))
 return 0;

 count = 0;

 while ( RB0_bit  && (count <= 90)) {
 count++;
 delay_us(50);
 }
 if ( (count > 89) || (count < 40))
 return 0;


 for (i = 0; i < 32; i++) {
 count = 0;
 while (( RB0_bit  == 0) && (count <= 23)) {
 count++;
 delay_us(50);
 }
 if ( (count > 22) || (count < 4))
 return 0;

 count = 0;
 while ( RB0_bit  && (count <= 45)) {
 count++;
 delay_us(50);
 }
 if ( (count > 44) || (count < 8))
 return 0;

 if ( count > 21)
 ir_code |= 1ul << (31 - i);
 else
 ir_code &= ~(1ul << (31 - i));
 }
 return 1;
}

void main()
{
 TRISB0_bit = 1;
 TRISC5_bit = 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Address:0x0000");
 Lcd_Out(2, 1, "Com:0x00 In:0x00");

  RC5_bit  = 1;
 Delay_ms(1000);
  RC5_bit  = 0;
 Delay_ms(1000);

 while (1) {


 if (nec_remote_read()) {
 address = ir_code >> 16;
 command = ir_code >> 8;
 inv_command = ir_code;
 IntToHex(address, text);
 Lcd_Out(1, 11, text);
 ByteToHex(command, text);
 Lcd_Out(2, 7, text);
 ByteToHex(inv_command, text);
 Lcd_Out(2, 15, text);

 switch (command) {
 case 0x48:
  RC5_bit  = 1;
 break;
 case 0x80:
  RC5_bit  = 0;
 break;
 }
 }
 }
}
