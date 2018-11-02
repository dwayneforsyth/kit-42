;**********************************************************************
display_1bit ; RGB Stick (14 * 3 = 42 LEDs
;**********************************************************************
    var temp4

    movwf        speed              ;w has the speed/delay

; set all var 0xA0 to 0xEF to zero
    movlw        LOW C3_C2_reg
    movwf        FSR0L

    movlw        0x24
    movwf        temp4

    movlw        0x00
clr_loop

    movwi        INDF0++
    decfsz       temp4,f
    goto         clr_loop

    MOVLP HIGH rgb_stick_expand
    call         rgb_stick_expand
    MOVLP HIGH display_1bit

    movf         speed,w
    call         strobe_delay

    return

