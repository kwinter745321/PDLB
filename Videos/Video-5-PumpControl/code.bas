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
