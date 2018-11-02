;#define BRIGHT1_lo 0x04
;#define BRIGHT2_lo 0x0A
;#define BRIGHT1_hi 0x40
;#define BRIGHT2_hi 0xA0

#define LEDCOUNT 12
;**********************************************************************
table_type_16
;**********************************************************************
;
;  1 bytes
;
;  ABBCCCCC
;
;  A = shire Right/Left
;  BB = two bit intensity to shift on
;  CCCCC = Number of shifts to loop
;  ABCxxxxx rrggbbxx
;  A = Red up/down
;  B = Green up/Down
;
;  rrbbggxx

;  if CCCCC = 0x11111, specical case: turn all LEDs off.

    var t7count
    var t17_loop

;    pageselw get_next_pattern_entry
    call         get_next_pattern_entry
    movwf        in0

    call         get_next_pattern_entry
    movwf        in1
;    pageselw table_type_16

    movlw        b'00011111'
    andwf        in0,w
    movwf        t7count

    movlw        b'00011111'  ; if shiftcount is 31, then clear all LEDs
    subwf        t7count,w
    btfss        STATUS,Z
    goto         t7_loop_red
    
    clrf         in0           ; quick way to clear all the LEDS.
    clrf         in1
    clrf         in2
    clrf         in3
    clrf         in4
    clrf         in5
;    pageselw display_1bit
    call         display_1bit
;    pageselw table_type_16
    goto         t7_return

t7_loop_red
    btfsc        in0,7
    goto         t7_set19_red

    call red_up
    goto         t7_loop_green

t7_set19_red

    call red_down

t7_loop_green
    btfsc        in0,6
    goto         t7_set19_green

    call green_up

    goto         t7_loop_blue
;
;   set LED 19
t7_set19_green

    call green_down

t7_loop_blue

    btfsc        in0,5
    goto         t7_set19_blue

    call blue_up

    goto         t7_cont
;
;   set LED 19
t7_set19_blue
    call  blue_dowm
t7_cont
;    pageselw strobe_delay
    movf         pspeed,w
    call         strobe_delay
;    pageselw t7_cont
;
;   This is a quick hack, because without this button presses are not seen for minutes
;   This early exit might impact the pattern getting displayed.
;
    btfsc        button,0    ; if putton pressed show pattern id
    goto         t7_return

    btfsc        IR_in_good,0
    goto         t7_return

    decfsz       t7count,f
    goto         t7_loop_red

t7_return
    return

;**********************************************************************
red_up
;**********************************************************************

    movlw        0x0b
    movwf        t17_loop

    movlw        LOW C2_C1_reg   ; index = 11 R
    movwf        FSR0L

red_up_loop
    movfw        INDF0        ; load R [index]
    incf         FSR0L,f         ; index ++
    movwf        INDF0        ; store R [index]

    decf         FSR0L,f         ; index - 2
    decf         FSR0L,f

    decfsz       t17_loop,f
    goto         red_up_loop
;
;   01 Red
;
;    movlw        LOW C3_C2_reg   ; index = 1 R
;    movwf        FSR0L

    incf         FSR0L,f
    clrf         INDF0
    movlw        BRIGHT1
    btfsc        in1,6
    addwf        INDF0,f     ;01
    movlw        BRIGHT2
    btfsc        in1,7
    addwf        INDF0,f     ;01

    return

;**********************************************************************
red_down
;**********************************************************************

    movlw        0x0b
    movwf        t17_loop

    movlw        C4_C3_reg   ; index = 02 R
    movwf        FSR

red_down_loop
    movfw        INDF        ; load R [index]
    decf         FSR,f         ; index - 1
    movwf        INDF        ; store R [index]

    incf         FSR,f         ; index + 2
    incf         FSR,f

    decfsz       t17_loop,f
    goto         red_down_loop
;
;   14 Red
;
;   movlw        LOW C2_C5_reg   ; index = 12 R
;   movwf        FSR0L
;   movlw        HIGH C2_C5_reg   ; index = 12 R
;   movwf        FSR0H

    decf         FSR,f
    clrf         INDF0
    movlw        BRIGHT1
    btfsc        in1,6
    addwf        INDF0,f     ;01
    movlw        BRIGHT2
    btfsc        in1,7
    addwf        INDF0,f     ;01

    return

;**********************************************************************
green_up
;**********************************************************************

    movlw        0x0b
    movwf        t17_loop

    movlw        C2_C0_reg   ; index = 11 G
    movwf        FSR

green_up_loop
    movfw        INDF        ; load G [index]
    incf         FSR,f         ; index ++
    movwf        INDF        ; store G [index]

    decf         FSR,f         ; index - 2
    decf         FSR,f

    decfsz       t17_loop,f
    goto         green_up_loop
;
;   01 Green
;
    incf         FSR,f
    clrf         INDF
    movlw        BRIGHT1
    btfsc        in1,4
    addwf        INDF,f     ;01
    movlw        BRIGHT2
    btfsc        in1,5
    addwf        INDF,f     ;01

    return

;**********************************************************************
green_down
;**********************************************************************

    movlw        0x0b
    movwf        t17_loop

    movlw        C4_C2_reg   ; index = 02 Green
    movwf        FSR

green_down_loop
    movfw        INDF        ; load R [index]
    decf         FSR,f         ; index - 1
    movwf        INDF        ; store R [index]

    incf         FSR,f         ; index + 2
    incf         FSR,f

    decfsz       t17_loop,f
    goto         green_down_loop
;
;   14 Green
;
    decf         FSR,f
    clrf         INDF
    movlw        BRIGHT1
    btfsc        in1,4
    addwf        INDF,f     ;01
    movlw        BRIGHT2
    btfsc        in1,5
    addwf        INDF,f     ;01

    return


;**********************************************************************
blue_up
;**********************************************************************

    movlw        0x0b
    movwf        t17_loop

    movlw        C2_A5_reg   ; index = 11 B
    movwf        FSR

blue_up_loop
    movfw        INDF        ; load G [index]
    incf         FSR,f         ; index ++
    movwf        INDF        ; store G [index]

    decf         FSR,f         ; index - 2
    decf         FSR,f

    decfsz       t17_loop,f
    goto         blue_up_loop
;
;   01 blue
;
    incf         FSR,f
    clrf         INDF
    movlw        BRIGHT1
    btfsc        in1,2
    addwf        INDF,f     ;01
    movlw        BRIGHT2
    btfsc        in1,3
    addwf        INDF,f     ;01

    return


;**********************************************************************
blue_dowm
;**********************************************************************

    movlw        0x0b
    movwf        t17_loop

    movlw        C4_C1_reg   ; index = 02 Blue
    movwf        FSR

blue_down_loop
    movfw        INDF        ; load R [index]
    decf         FSR,f         ; index - 1
    movwf        INDF        ; store R [index]

    incf         FSR,f         ; index + 2
    incf         FSR,f

    decfsz       t17_loop,f
    goto         blue_down_loop
;
;   14 Green
;
    decf         FSR,f
    clrf         INDF
    movlw        BRIGHT1
    btfsc        in1,2
    addwf        INDF,f     ;01
    movlw        BRIGHT2
    btfsc        in1,3
    addwf        INDF,f     ;01

    return
