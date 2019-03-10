/* Pin Configuration */
#define IR_PIN                GP3_bit       /**< IR Signal Reception Pin.*/
#define LED_PIN               GP2_bit

unsigned long ir_code;
unsigned int address;
unsigned short command, inv_command;

unsigned char i;

short nec_remote_read() {

  unsigned long count = 0, i;
  // Check 9ms pulse (remote control sends logic high)
  while ((IR_PIN == 0) && (count < 180)) {
    count++;
    delay_us(40);
  }
  
  count = 0;
  // Check 4.5ms space (remote control sends logic low)
  while (IR_PIN && (count < 90)) {
    count++;
    delay_us(40);
  }

  // Read code message (32-bit)
  for (i = 0; i < 32; i++) {
    count = 0;
    while ((IR_PIN == 0) && (count < 15)) {
      count++;
      delay_us(30);
    }
    if ( (count > 14) || (count < 2))     // NEC protocol?
      return 0;

    count = 0;
    while (IR_PIN && (count < 30)) {
      count++;
      delay_us(30);
    }
    if ( (count > 29) || (count < 4))     // NEC protocol?
      return 0;

    if ( count > 20)                      // If space width > 1ms
      ir_code |= 1ul << (31 - i);         // Write 1 to bit (31 - i)
    else                                  // If space width < 1ms
      ir_code &= ~(1ul << (31 - i));      // Write 0 to bit (31 - i)
  }
  return 1;
}

void main()
{
  ANSEL       = 0x00;                        //Digital IOs only
  CMCON       = 0x07;                        //Disables comparators
  TRISIO      = 0x08;                        //GP3 are input, others are output
  OPTION_REG  = 0x80;                        //Disable pull-ups
  LED_PIN = 1;
  Delay_ms(1000);
  LED_PIN = 0;
  Delay_ms(1000);

  while (1) { //Loop executed infinite times

    if (nec_remote_read()) {
      address = ir_code >> 16;
      command = ir_code >> 8;

      switch (command) {
        case 0x68:
          LED_PIN = 1;
          break;
        case 0x30:
          LED_PIN = 0;
          break;
      }
    }
  }
}