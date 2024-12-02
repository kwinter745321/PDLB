'Pico Display Layout Builder v1.0
'PicoMite v5.07
'Control layout configured: 2024-12-02 15:37:23.
'
GUI DELETE ALL
cls RGB(black) 
COLOUR RGB(white), RGB(black) 
FONT 3,1
CONST C_HEAD = 1  'a CntrlVal name
CONST C_PMP = 2  'a CntrlVal name
CONST SW_PMP = 3  'a CntrlVal name
CONST C_FLOW = 4  'a CntrlVal name
CONST TB_FLOW = 5  'a CntrlVal name
CONST FRM_PUMP = 6  'a CntrlVal name
CONST R_ECON = 7  'a CntrlVal name
CONST R_NORM = 8  'a CntrlVal name
CONST R_HI = 9  'a CntrlVal name
CONST FRM_ALARM = 10  'a CntrlVal name
CONST C_HI = 11  'a CntrlVal name
CONST NBR_HI = 12  'a CntrlVal name
CONST C_LO = 13  'a CntrlVal name
CONST NBR_LO = 14  'a CntrlVal name
CONST PB_TEST = 15  'a CntrlVal name
CONST LED_RUN = 16  'a CntrlVal name
CONST LED_ALARM = 17  'a CntrlVal name
CONST FRM_LOG = 18  'a CntrlVal name
CONST C_FNAME = 19  'a CntrlVal name
CONST TB_FNAME = 20  'a CntrlVal name
CONST CB_ENABLED = 21  'a CntrlVal name
CONST C_LOG = 22  'a CntrlVal name
CONST CB_FLOW = 23  'a CntrlVal name
CONST CB_ALARM = 24  'a CntrlVal name
CONST CB_WARN = 25  'a CntrlVal name
CONST C_BRIGHT = 26  'a CntrlVal name
CONST SB_BRIGHT = 27  'a CntrlVal name
GUI CAPTION C_HEAD,"Pump Control",10,0,"LT",RGB(white),RGB(black)
GUI CAPTION C_PMP,"Pump",20,60,"LT",RGB(brown),RGB(black)
GUI SWITCH SW_PMP,"ON|OFF",20,90,150,50,RGB(white),RGB(brown)
GUI CAPTION C_FLOW,"Flow Rate",20,170,"LT",RGB(brown),RGB(black)
GUI DISPLAYBOX TB_FLOW,20,200,150,45,RGB(brown),RGB(black)
Z6=RGB(200,200,255)
GUI FRAME FRM_PUMP,"Power",17,288,170,163,Z6
GUI RADIO R_ECON,"Economy",40,333,15,RGB(lightgrey)
GUI RADIO R_NORM,"Normal",40,379,15,RGB(lightgrey)
GUI RADIO R_HI,"High",40,423,15,RGB(lightgrey)
GUI FRAME FRM_ALARM,"Alarm",220,220,200,233,RGB(green)
GUI CAPTION C_HI,"High",232,260,"LT",RGB(yellow),RGB(black)
GUI NUMBERBOX NBR_HI,315,257,90,42,RGB(yellow),RGB(black)
GUI CAPTION C_LO,"Low",232,325,"LT",RGB(yellow),RGB(black)
GUI NUMBERBOX NBR_LO,314,324,90,42,RGB(yellow),RGB(black)
GUI BUTTON PB_TEST,"TEST",254,380,130,40,RGB(yellow),RGB(red)
GUI LED LED_RUN,"Running",237,87,15,RGB(Green)
GUI LED LED_ALARM,"Alarm",239,144,15,RGB(red)
GUI FRAME FRM_LOG,"Log File",450,20,330,355,RGB(green)
GUI CAPTION C_FNAME,"File Name",470,105,"LT",RGB(cyan),RGB(black)
GUI TEXTBOX TB_FNAME,466,137,290,40,RGB(cyan),RGB(black)
GUI CHECKBOX CB_ENABLED,"Logging Enabled",468,47,30,RGB(cyan)
GUI CAPTION C_LOG,"Record:",470,205,"LT",RGB(cyan),RGB(black)
GUI CHECKBOX CB_FLOW,"Flow Rate",500,245,25,RGB(cyan)
GUI CHECKBOX CB_ALARM,"Alarms",500,285,25,RGB(cyan)
GUI CHECKBOX CB_WARN,"Warnings",500,325,25,RGB(cyan)
Z26=RGB(200,200,255)
GUI CAPTION C_BRIGHT,"Backlight",441,420,"LT",Z26,RGB(black)
Z27=RGB(200,200,255)
GUI SPINBOX SB_BRIGHT,580,400,200,50,Z27,RGB(black),10,10,100
INIT() '' Calls INIT in code file.
CtrlVal(SW_PMP) = 1
CtrlVal(R_NORM) = 1
CtrlVal(NBR_HI) = 35.5
CtrlVal(NBR_LO) = 15.7
CtrlVal(TB_FNAME) = "LOGFILE.TXT"
CtrlVal(CB_ENABLED) = 1
CtrlVal(SB_BRIGHT) = 50
DO
'CtrlVal(TB_FLOW) = "20.1" 
CtrlVal(LED_RUN) = CtrlVal(sw_pmp) 
MAIN()  ' Calls MAIN in code file.
CPU SLEEP 0.1
LOOP
''Code File:code.bas
sub INIT()
   GUI Interrupt TouchDown, TouchUp 
   dim integer x, y, lb, rb, sb, xs, ys, cs, ss 
   CtrlVal(tb_flow) = "20.1"
end sub

sub MAIN()
end



' the interrupt routine for touch down 
' using a select case command it has a different process for each 
' control 
Sub TouchDown 
local integer mbox 
'  print "down" 
Select Case touch(REF) ' find out the control touched 
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
' interrupt routine when the touch is removed new
Sub TouchUp 
Select Case touch(LASTREF) ' use the last reference 
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
