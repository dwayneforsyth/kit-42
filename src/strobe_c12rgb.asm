;-------------------------------------------------------------------------------
display_cycle0
;-------------------------------------------------------------------------------
#ifdef Common_Cathode
    LedOutInd  A5_C0_reg,Cx_dir,0    ;LED A5-C0
    LedOutInd  A5_C1_reg,Cx_dir,1    ;LED A5-C1
    LedOutInd  A5_C2_reg,Cx_dir,2    ;LED A5-C2
    LedOutInd  A5_C3_reg,Cx_dir,3    ;LED A5-C3
    LedOutInd  A5_C4_reg,Cx_dir,4    ;LED A5-C4
    LedOutInd  A5_C5_reg,Cx_dir,5    ;LED A5-C5
#else
    LedOutInd  C0_A5_reg,Cx_dir,0    ;LED C0-A5
;    LedOutInd  C1_A5_reg,Cx_dir,1    ;LED C1-A5
    LedOutInd  C2_A5_reg,Cx_dir,2    ;LED C2-A5
    LedOutInd  C3_A5_reg,Cx_dir,3    ;LED C3-A5
    LedOutInd  C4_A5_reg,Cx_dir,4    ;LED C4-A5
    LedOutInd  C5_A5_reg,Cx_dir,5    ;LED C5-A5  
#endif
    banksel TRISA
    movf    Ax_dir,w      ;set portA direction
    movwf   TRISA
    movf    Cx_dir,w      ;set portA direction
    movwf   TRISC

    banksel PORTA

    movlw   b'00100000'
    movwf   PORTA
    movlw   b'00000000'
    movwf   PORTC

    decfsz  fcount,f
    goto    display_cycle0

    goto return_display_cycle

;-------------------------------------------------------------------------------
display_cycle1
;-------------------------------------------------------------------------------
#ifdef Common_Cathode
    LedOutInd  C0_A5_reg,Ax_dir,5    ;LED C0-A5
    LedOutInd  C0_C1_reg,Cx_dir,1    ;LED C0-C1
    LedOutInd  C0_C2_reg,Cx_dir,2    ;LED C0-C2
    LedOutInd  C0_C3_reg,Cx_dir,3    ;LED C0-C3
    LedOutInd  C0_C4_reg,Cx_dir,4    ;LED C0-C4
    LedOutInd  C0_C5_reg,Cx_dir,5    ;LED C0-C5
#else
    LedOutInd  A5_C0_reg,Ax_dir,5    ;LED C0-A5
;    LedOutInd  C1_C0_reg,Cx_dir,1    ;LED C0-C1
    LedOutInd  C2_C0_reg,Cx_dir,2    ;LED C0-C2
    LedOutInd  C3_C0_reg,Cx_dir,3    ;LED C0-C3
    LedOutInd  C4_C0_reg,Cx_dir,4    ;LED C0-C4
    LedOutInd  C5_C0_reg,Cx_dir,5    ;LED C0-C5
#endif
    banksel TRISA
    movf    Ax_dir,w      ;set portA direction
    movwf   TRISA
    movf    Cx_dir,w      ;set portA direction
    movwf   TRISC

    banksel PORTA
    movlw   b'00000000'
    movwf   PORTA

    movlw   b'00000001'
    movwf   PORTC

    decfsz  fcount,f
    goto    display_cycle1

    goto return_display_cycle

;-------------------------------------------------------------------------------
display_cycle2
;-------------------------------------------------------------------------------
#ifdef Common_Cathode
;    LedOutInd  C1_A5_reg,Ax_dir,5    ;LED C1-A5
;    LedOutInd  C1_C0_reg,Cx_dir,0    ;LED C1-C0
;    LedOutInd  C1_C2_reg,Cx_dir,2    ;LED C1-C2
;    LedOutInd  C1_C3_reg,Cx_dir,3    ;LED C1-C3
;    LedOutInd  C1_C4_reg,Cx_dir,4    ;LED C1-C4
;    LedOutInd  C1_C5_reg,Cx_dir,5    ;LED C1-C5
#else
    LedOutInd  A5_C1_reg,Ax_dir,5    ;LED C1-A5
    LedOutInd  C0_C1_reg,Cx_dir,0    ;LED C1-C0
    LedOutInd  C2_C1_reg,Cx_dir,2    ;LED C1-C2
    LedOutInd  C3_C1_reg,Cx_dir,3    ;LED C1-C3
    LedOutInd  C4_C1_reg,Cx_dir,4    ;LED C1-C4
    LedOutInd  C5_C1_reg,Cx_dir,5    ;LED C1-C5
#endif
    banksel TRISA
    movf    Ax_dir,w      ;set portA direction
    movwf   TRISA
    movf    Cx_dir,w      ;set portA direction
    movwf   TRISC

    banksel PORTA
    movlw   b'00000000'
    movwf   PORTA

    movlw   b'00000010'
    movwf   PORTC

    decfsz  fcount,f
    goto    display_cycle2

    goto return_display_cycle

;-------------------------------------------------------------------------------
display_cycle3
;-------------------------------------------------------------------------------
#ifdef Common_Cathode
    LedOutInd  C2_A5_reg,Ax_dir,5    ;LED C2-A5
    LedOutInd  C2_C0_reg,Cx_dir,0    ;LED C2-C0
    LedOutInd  C2_C1_reg,Cx_dir,1    ;LED C2-C1
    LedOutInd  C2_C3_reg,Cx_dir,3    ;LED C2-C3
    LedOutInd  C2_C4_reg,Cx_dir,4    ;LED C2-C4
    LedOutInd  C2_C5_reg,Cx_dir,5    ;LED C2-C5
#else
    LedOutInd  A5_C2_reg,Ax_dir,5    ;LED C2-A5
    LedOutInd  C0_C2_reg,Cx_dir,0    ;LED C2-C0
    LedOutInd  C1_C2_reg,Cx_dir,1    ;LED C2-C1
    LedOutInd  C3_C2_reg,Cx_dir,3    ;LED C2-C3
    LedOutInd  C4_C2_reg,Cx_dir,4    ;LED C2-C4
    LedOutInd  C5_C2_reg,Cx_dir,5    ;LED C2-C5
#endif
    banksel TRISA
    movf    Ax_dir,w      ;set portA direction
    movwf   TRISA
    movf    Cx_dir,w      ;set portA direction
    movwf   TRISC

    banksel PORTA
    movlw   b'00000000'
    movwf   PORTA

    movlw   b'00000100'
    movwf   PORTC

    decfsz  fcount,f
    goto    display_cycle3

    goto return_display_cycle

;-------------------------------------------------------------------------------
display_cycle4
;-------------------------------------------------------------------------------
#ifdef Common_Cathode
    LedOutInd  C3_A5_reg,Ax_dir,5    ;LED C3-A5  
    LedOutInd  C3_C0_reg,Cx_dir,0    ;LED C3-C0
    LedOutInd  C3_C1_reg,Cx_dir,1    ;LED C3-C1
    LedOutInd  C3_C2_reg,Cx_dir,2    ;LED C3-C2
    LedOutInd  C3_C4_reg,Cx_dir,4    ;LED C3-C4
    LedOutInd  C3_C5_reg,Cx_dir,5    ;LED C3-C5
#else
    LedOutInd  A5_C3_reg,Ax_dir,5    ;LED C3-A5  
    LedOutInd  C0_C3_reg,Cx_dir,0    ;LED C3-C0
;    LedOutInd  C1_C3_reg,Cx_dir,1    ;LED C3-C1
    LedOutInd  C2_C3_reg,Cx_dir,2    ;LED C3-C2
    LedOutInd  C4_C3_reg,Cx_dir,4    ;LED C3-C4
    LedOutInd  C5_C3_reg,Cx_dir,5    ;LED C3-C5
#endif
    banksel TRISA
    movf    Ax_dir,w      ;set portA direction
    movwf   TRISA
    movf    Cx_dir,w      ;set portA direction
    movwf   TRISC

    banksel PORTA
    movlw   b'00000000'
    movwf   PORTA

    movlw   b'00001000'
    movwf   PORTC

    decfsz  fcount,f
    goto    display_cycle4

    goto return_display_cycle

;-------------------------------------------------------------------------------
display_cycle5
;-------------------------------------------------------------------------------
#ifdef Common_Cathode
    LedOutInd  C4_A5_reg,Ax_dir,5    ;LED C4-A5
    LedOutInd  C4_C0_reg,Cx_dir,0    ;LED C4-C0
    LedOutInd  C4_C1_reg,Cx_dir,1    ;LED C4-C1
    LedOutInd  C4_C2_reg,Cx_dir,2    ;LED C4-C2
    LedOutInd  C4_C3_reg,Cx_dir,3    ;LED C4-C3
    LedOutInd  C4_C5_reg,Cx_dir,5    ;LED C4-C5
#else
    LedOutInd  A5_C4_reg,Ax_dir,5    ;LED C4-A5
    LedOutInd  C0_C4_reg,Cx_dir,0    ;LED C4-C0
;    LedOutInd  C1_C4_reg,Cx_dir,1    ;LED C4-C1
    LedOutInd  C2_C4_reg,Cx_dir,2    ;LED C4-C2
    LedOutInd  C3_C4_reg,Cx_dir,3    ;LED C4-C3
    LedOutInd  C5_C4_reg,Cx_dir,5    ;LED C4-C5
#endif
    banksel TRISA
    movf    Ax_dir,w      ;set portA direction
    movwf   TRISA
    movf    Cx_dir,w      ;set portA direction
    movwf   TRISC

    banksel PORTA
    movlw   b'00000000'
    movwf   PORTA

    movlw   b'00010000'
    movwf   PORTC

    decfsz  fcount,f
    goto    display_cycle5

    goto return_display_cycle

;-------------------------------------------------------------------------------
display_cycle6
;-------------------------------------------------------------------------------
#ifdef Common_Cathode
    LedOutInd  C5_A5_reg,Ax_dir,5    ;LED C5-A5  
    LedOutInd  C5_C0_reg,Cx_dir,0    ;LED C5-C0
    LedOutInd  C5_C1_reg,Cx_dir,1    ;LED C5-C1
    LedOutInd  C5_C2_reg,Cx_dir,2    ;LED C5-C2
    LedOutInd  C5_C3_reg,Cx_dir,3    ;LED C5-C3
    LedOutInd  C5_C4_reg,Cx_dir,4    ;LED C5-C4
#else
    LedOutInd  A5_C5_reg,Ax_dir,5    ;LED C5-A5  
    LedOutInd  C0_C5_reg,Cx_dir,0    ;LED C5-C0
;    LedOutInd  C1_C5_reg,Cx_dir,1    ;LED C5-C1
    LedOutInd  C2_C5_reg,Cx_dir,2    ;LED C5-C2
    LedOutInd  C3_C5_reg,Cx_dir,3    ;LED C5-C3
    LedOutInd  C4_C5_reg,Cx_dir,4    ;LED C5-C4
#endif
    banksel TRISA
    movf    Ax_dir,w      ;set portA direction
    movwf   TRISA
    movf    Cx_dir,w      ;set portA direction
    movwf   TRISC

    banksel PORTA
    movlw   b'00000000'
    movwf   PORTA

    movlw   b'00100000'
    movwf   PORTC

    decfsz  fcount,f
    goto    display_cycle6

    goto return_display_cycle

