// LCD module connections
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
// End LCD module connections

/* Pin Configuration */
#define IR_PIN                RB0_bit       /**< IR Signal Reception Pin.*/
#define LED_PIN               RC5_bit

char text[5];
unsigned long ir_code;
unsigned int address;
unsigned short command, inv_command;

short nec_remote_read() {

  unsigned long count = 0, i;
  // Check 9ms pulse (remote control sends logic high)
  while ((IR_PIN == 0) && (count <= 180)) {
    count++;
    delay_us(50);
  }
  if ( (count > 179) || (count < 120))     // NEC protocol?
    return 0;

  count = 0;
  // Check 4.5ms space (remote control sends logic low)
  while (IR_PIN && (count <= 90)) {
    count++;
    delay_us(50);
  }
  if ( (count > 89) || (count < 40))       // NEC protocol?
    return 0;

  // Read code message (32-bit)
  for (i = 0; i < 32; i++) {
    count = 0;
    while ((IR_PIN == 0) && (count <= 23)) {
      count++;
      delay_us(50);
    }
    if ( (count > 22) || (count < 4))     // NEC protocol?
      return 0;

    count = 0;
    while (IR_PIN && (count <= 45)) {
      count++;
      delay_us(50);
    }
    if ( (count > 44) || (count < 8))     // NEC protocol?
      return 0;

    if ( count > 21)                      // If space width > 1ms
      ir_code |= 1ul << (31 - i);         // Write 1 to bit (31 - i)
    else                                  // If space width < 1ms
      ir_code &= ~(1ul << (31 - i));      // Write 0 to bit (31 - i)
  }
  return 1;
}

void main()
{
  TRISB0_bit = 1;
  TRISC5_bit = 0;
  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1, 1, "Address:0x0000");
  Lcd_Out(2, 1, "Com:0x00 In:0x00");

  LED_PIN = 1;
  Delay_ms(1000);
  LED_PIN = 0;
  Delay_ms(1000);

  while (1) { //Loop executed infinite times

    //while (IR_PIN);                //Wait until IR pin falls
    if (nec_remote_read()) {
      address = ir_code >> 16;
      command = ir_code >> 8;
      inv_command = ir_code;
      IntToHex(address, text);       // Save address in string text with hex format
      Lcd_Out(1, 11, text);          // Display address
      ByteToHex(command, text);      // Save command in string text with hex format
      Lcd_Out(2, 7, text);           // Display command
      ByteToHex(inv_command, text);  // Save inverted command in string text with hex format
      Lcd_Out(2, 15, text);          // Display inverted command

      switch (command) {
        case 0x48:
          LED_PIN = 1;
          break;
        case 0x80:
          LED_PIN = 0;
          break;
      }
    }
  }
}