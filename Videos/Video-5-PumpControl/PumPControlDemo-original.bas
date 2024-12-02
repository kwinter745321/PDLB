Option Explicit 
Dim ledsY 
'mode 10 
option console serial 
Colour RGB(white), RGB(black) 
' reference numbers for the controls are defined as constants 
Const c_head = 1, c_pmp = 2, sw_pmp = 3, c_flow = 4, tb_flow = 5 
Const led_run = 6, led_alarm = 7 
Const frm_alarm = 20, nbr_hi = 21, nbr_lo = 22, pb_test =23 
Const c_hi = 24, c_lo = 25 
Const frm_pump = 30, r_econ = 31, r_norm = 32, r_hi = 33 
Const frm_log = 40, cb_enabled = 41, c_fname = 42, tb_fname = 43 
Const c_log = 44, cb_flow = 45, cb_pwr = 46, cb_warn = 47 
Const cb_alarm = 48, c_bright = 49, sb_bright = 50 
' now draw the "Pump Control" display 
'CLS 
dim integer x, y, lb, rb, sb, xs, ys, cs, ss 
'sprite load "mouse.spr",1 
gui cursor on 0, mm.hres\2,mm.vres\2 
GUI Interrupt TouchDown, TouchUp 
' display the heading 
Font 2,2 : GUI Caption c_head, "Pump Control", 10, 0 
Font 3 : GUI Caption c_pmp, "Pump", 20, 60, , RGB(brown) 
' now, define and display the controls 
' first 
GUI Switch sw_pmp, "ON|OFF", 20, 90, 150, 50, RGB(white),RGB(brown) 
CtrlVal(sw_pmp) = 1 
' the flow rate display box 
Font 3 : GUI Caption c_flow, "Flow Rate", 20, 170,, RGB(brown),0 
Font 4 : GUI Displaybox tb_flow, 20, 200, 150, 45 
CtrlVal(tb_flow) = "20.1" 
' the radio buttons and their frame 
Font 3 : GUI Frame frm_pump, "Power", 20, 290, 170, 163,RGB(200,20,255) 
GUI Radio r_econ, "Economy", 40, 318, 15, RGB(230, 230, 255) 
GUI Radio r_norm, "Normal", 40, 364 
GUI Radio r_hi, "High", 40, 408 
CtrlVal(r_norm) = 1 ' start with the "normal" button selected 
' the alarm frame with two number boxes and a push button switch 
Font 3 : GUI Frame frm_alarm, "Alarm", 220, 220, 200, 233,RGB(green) 
GUI Caption c_hi, "High:", 232, 260, LT, RGB(yellow) 
GUI Numberbox nbr_hi, 318,MM.info(VPos)
6,90,MM.info(FontHeight)+12,RGB(yellow),RGB(64,64,64) 
GUI Caption c_lo, "Low:", 232, 325, LT, RGB(yellow),0 
GUI Numberbox nbr_lo, 318,MM.info(VPos)
6,90,MM.info(FontHeight)+12,RGB(yellow),RGB(64,64,64) 
GUI Button pb_test, "TEST", 257, 383, 130, 40,RGB(yellow), RGB(red) 
CtrlVal(nbr_lo) = 15.7 : CtrlVal(nbr_hi) = 35.5 
' draw the two LEDs 
Const ledsX = 240, coff = 50 ' define their position 
ledsY = 90 : GUI LED led_run, "Running", ledsX, ledsY, 15, RGB(green) 
ledsY = ledsY+49 : GUI LED led_alarm, "Alarm", ledsX, ledsY, 15, RGB(red) 
CtrlVal(led_run) = 1 ' the switch defaults to on so set the LED on 
' the logging frame with check boxes and a text box 
Colour RGB(cyan), 0 
GUI Frame frm_log, "Log File", 450, 20, 330, 355, RGB(green) 
GUI Checkbox cb_enabled, "Logging Enabled", 470, 50, 30, RGB(cyan) 
GUI Caption c_fname, "File Name", 470, 105 
GUI Textbox tb_fname, 470, 135, 290, 40, RGB(cyan), RGB(64,64,64) 
GUI Caption c_log, "Record:", 470, 205, , RGB(cyan), 0 
GUI Checkbox cb_flow, "Flow Rate", 500, 245, 25 
GUI Checkbox cb_alarm, "Alarms", 500, 285, 25 
GUI Checkbox cb_warn, "Warnings", 500, 325, 25 
CtrlVal(cb_enabled) = 1 
CtrlVal(tb_fname) = "LOGFILE.TXT" 
' define and display the spinbox for controlling the backlight 
GUI Caption c_bright, "Backlight", 442, 415,,RGB(200,200,255),0 
GUI Spinbox sb_bright, MM.info(HPos) + 8, 400, 200, 50,,,10, 10, 100 
CtrlVal(sb_bright) = 50 
' All the controls have been defined and displayed. At this point 
' the program could do some real work but because this is just a 
' demo there is nothing to do. So it just sits in a loop. 
Do 
Loop 
' the interrupt routine for touch down 
' using a select case command it has a different process for each 
' control 
Sub TouchDown 
local integer mbox 
'  print "down" 
Select Case click(REF) ' find out the control touched 
Case cb_enabled ' the enable check box 
  If CtrlVal(cb_enabled) Then 
    GUI Restore c_fname, tb_fname, c_log, cb_flow, cb_alarm, cb_warn 
  Else 
    mbox=MsgBox("Are you sure?", "YES","CANCEL") 
'      print mbox 
    if mbox=1 then 
      GUI Disable c_fname, tb_fname, c_log, cb_flow, cb_alarm, cb_warn 
    else 
      CtrlVal(cb_enabled)=1 
    endif 
  EndIf 
Case sb_bright ' the brightness spin box 
'    BackLight CtrlVal(sb_bright) 
Case sw_pmp ' the pump on/off switch 
  CtrlVal(led_run) = CtrlVal(sw_pmp) 
  CtrlVal(tb_flow) = Str$(CtrlVal(sw_pmp) * 20.1) 
  CtrlVal(r_norm) = 1 
Case pb_test ' the alarm test button 
  CtrlVal(led_alarm) = 1 
'    GUI beep 250 
Case r_econ ' the economy radio button 
  CtrlVal(tb_flow) = Str$(CtrlVal(sw_pmp) * 18.3) 
Case r_norm ' the normal radio button 
  CtrlVal(tb_flow) = Str$(CtrlVal(sw_pmp) * 20.1) 
Case r_hi ' the high radio button 
  CtrlVal(tb_flow) = Str$(CtrlVal(sw_pmp) * 23.7) 
End Select 
End Sub 
' interrupt routine when the touch is removed 
Sub TouchUp 
Select Case click(LASTREF) ' use the last reference 
Case pb_test ' was it the test button 
  CtrlVal(led_alarm) = 0 ' turn off the LED 
End Select 
End Sub 
' 
Function MM.CURSOR( t As Integer) As Integer 
Static Float lasttime 
If Timer > lasttime + 20 Or timer < lasttime Then 
  X = Mouse(x,1) 
  Y = Mouse(y,1) 
  Lb = Mouse(l,1) 
  lasttime = Timer 
  Gui Cursor x,y 
EndIf 
MM.CURSOR = -1 
If t = 1 Then 
  MM.CURSOR = lb 
ElseIf t = 2 Then 
  If lb Then MM.CURSOR = x 
ElseIf t = 3 Then
If lb Then MM.CURSOR = y 
ElseIf t = 4 Then 
MM.CURSOR = lb 
Else 
MM.CURSOR = lb 
EndIf 
End Function 
' 
Sub MM.Beep beeptime As Integer 
If beeptime And MM.Info(Sound) = "OFF" Then Play Tone 600, 600, beeptime 
End Sub 
