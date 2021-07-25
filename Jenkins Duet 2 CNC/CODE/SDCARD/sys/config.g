; Configuration file for Duet 2  FIRMWARE RepRapFirmware 3.3 and later
; executed by the firmware on start-up
; Generated referencing RepRapFirmware Configuration Tool v3.1.8 and WorkBee Firmware Version 1.0.7

;Jenkins CNC For Duet2 v0.1
;Updated 7.13.21
;Board: Duet 2
;Firmware: Reprap Firmware 3.3 and later



; General preferences
M453 					                ; Put the machine into CNC Modes
M550 P"Duet CNC"                      			; set printer name
G90 					                ; Set absolute coordinates
G21 					                ; Set units to mm


; Network
M552 S1                                 ; enable network
M586 P0 S1                              ; enable HTTP
M586 P1 S0                              ; disable FTP
M586 P2 S0                              ; disable Telnet

; Drives
M569 P0 S0                              ; physical drive 0 goes forwards
M569 P1 S1                              ; physical drive 1 goes forwards
M569 P2 S0                              ; physical drive 2 goes forwards
M569 P3 S1                              ; physical drive 3 goes forwards
M584 X0 Y1:3 Z2                       ; set drive mapping

; Configure Axes
M92 X80 Y80 Z400 			; Set steps per mm
M350 X16 Y16 Z16 I1 			; Configure microstepping
M566 X500 Y500 Z500 			; Set maximum instantaneous speed changes (mm/min)
M203 X5000 Y5000 Z5000 			; Set maximum speeds (mm/min)
M201 X150 Y150 Z150 			; Set accelerations (mm/s^2)
M906 X800 Y800 Z800 I100 		; Set motor currents (mA)

; Configure Axis Limits
M208 X-838 Y-838 Z-85 S1 		        ; Set axis minima  ( 0 = set axis maximum (default), 1 = set axis minimum)
M208 X0 Y0 Z0 S0            		    ; set axis maxima  ( 0 = set axis maximum (default), 1 = set axis minimum)

; Configure Endstops
M574 X2  S1  P"!xstop" 			; Set High End / active High endstops x endstop
M574 Y2  S1  P"!ystop" 			; Set High End / active High endstops y endstop	
M574 Z2  S1  p"!zstop" 			; Set High End / active High endstops z endstop


; Z-Probe
M558 k2 P8 C"!e0stop" H5 F100 T3000     	; set Z probe type to switch and the dive height + speeds
G31 Z0                     				; set Z probe trigger value, offset and trigger height


; CNC INPUTS
;M950 J1 C"!io7.in"                         ; create input pin 1 on pin io7.in (Spindle on & At rpm) 
;M950 J2 C"!io8.in"                         ; create input pin 2 on pin io8.in (Spindle Stopped) 

; CNC OUTPUTS
;M950 P1 C"out1"                         ; create io 1 on pin out1 (TOOL CHANGER) 
;M950 P2 C"out2"                         ; create io 2 on pin out2 (COOLENT)
;M950 P4 C"out4"                         ; create io 4 on pin out4 (RGB LIGHTING : BLUE)
;M950 P5 C"out5"                         ; create io 5 on pin out5 (RGB LIGHTING : GREEN)
;M950 P6 C"out6"                         ; create io 6 on pin out6 (RGB LIGHTING : RED)
;M950 F7 C"out7" Q500                    ; create fan 7 on pin out7 and set its frequency (FAN)
;M950 F8 C"out8" Q500                    ; create fan 8 on pin out8 and set its frequency (FAN)


; CNC OUTPUTS SPINDLE
M950 R0 C"fan2" L0:24000 			; Create spindle index 0, with PWM pin on OUT 9  and Supports range 0-2400 RPM


; Tools
M563 P1 S"1" R0                     ; define tool 1 with spindle 0 
G10 P1 X0 Y0 Z0                         ; set tool 1 axis offsets



; Other Settings
;M575 P1 S1 B57600                      ; enable support for PanelDue
M140 H-1 								; Disable heated bed
M564 S1 H1 								; Disable jog commands when not homed
M911 S21.0 R23 P"G91 G1 Z3 F1000" 		; Configure power loss resume
M501									; Load Stored Parameters 
G28			          					; Home all Axis
T1	P0	                  ; Select tool 1 to turn it on but don't execute tool change scripts	






