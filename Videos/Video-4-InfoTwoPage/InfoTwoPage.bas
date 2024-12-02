'Pico Display Layout Builder v1.0
'PicoMite v5.07
'Control layout configured: 2024-09-17 22:09:07.
'
GUI DELETE ALL
cls RGB(black) 
COLOUR RGB(white), RGB(black) 
FONT 3,1
CONST CVNEXTPAGE = 7  'a CntrlVal name
CONST CVBTN1 = 8  'a CntrlVal name
CONST CVBTN2 = 9  'a CntrlVal name
CONST CVPOT1 = 10  'a CntrlVal name
CONST CVLED1 = 12  'a CntrlVal name
CONST CVLED2 = 13  'a CntrlVal name
CONST BTN1_NONE = 18  'a CntrlVal name
CONST BTN1_LED1 = 19  'a CntrlVal name
CONST BTN1_LED2 = 20  'a CntrlVal name
CONST BTN2_NONE = 21  'a CntrlVal name
CONST BTN2_LED1 = 22  'a CntrlVal name
CONST BTN2_LED2 = 23  'a CntrlVal name
CONST POT1_NONE = 24  'a CntrlVal name
CONST POT1_20 = 25  'a CntrlVal name
CONST POT1_25 = 26  'a CntrlVal name
CONST POT1_30 = 27  'a CntrlVal name
CONST CVHOMEPAGE = 28  'a CntrlVal name
GUI SETUP 1
GUI CAPTION #1,"Page 1",675,25,"LT",RGB(white),RGB(black)
GUI FRAME #2,"Onboard Devices",160,90,500,300,RGB(yellow)
GUI CAPTION #3,"BTN1",196,131,"LT",RGB(white),RGB(black)
GUI CAPTION #4,"BTN2",197,184,"LT",RGB(white),RGB(black)
GUI CAPTION #5,"POT1",196,234,"LT",RGB(white),RGB(black)
GUI CAPTION #6,"LED1",200,280,"LT",RGB(white),RGB(black)
GUI BUTTON CVNEXTPAGE,"Next Page",524,400,250,50,RGB(black),RGB(gold)
GUI CAPTION CVBTN1,"btn1",394,130,"LT",RGB(white),RGB(black)
GUI CAPTION CVBTN2,"btn2",398,185,"LT",RGB(white),RGB(black)
GUI CAPTION CVPOT1,"pot1",399,234,"LT",RGB(white),RGB(black)
GUI CAPTION #11,"LED2",200,330,"LT",RGB(white),RGB(black)
GUI CAPTION CVLED1,"led1",396,278,"LT",RGB(white),RGB(black)
GUI CAPTION CVLED2,"led2",399,335,"LT",RGB(white),RGB(black)
GUI SETUP 2
GUI CAPTION #14,"Page 2",675,25,"LT",RGB(white),RGB(black)
GUI FRAME #15,"Choose Output Action",141,56,600,85,RGB(yellow)
GUI FRAME #16,"Choose Output Action",144,192,600,85,RGB(yellow)
GUI FRAME #17,"Choose Hi alarm",146,309,600,80,RGB(yellow)
GUI RADIO BTN1_NONE,"None",200,99,20,RGB(green)
GUI RADIO BTN1_LED1,"LED1",425,96,20,RGB(green)
GUI RADIO BTN1_LED2,"LED2",600,95,20,RGB(green)
GUI RADIO BTN2_NONE,"None",200,234,20,RGB(green)
GUI RADIO BTN2_LED1,"LED1",425,230,20,RGB(green)
GUI RADIO BTN2_LED2,"LED2",600,231,20,RGB(green)
GUI RADIO POT1_NONE,"None",200,347,20,RGB(green)
GUI RADIO POT1_20,"2.0",370,348,20,RGB(green)
GUI RADIO POT1_25,"2.5",493,349,20,RGB(green)
GUI RADIO POT1_30,"3.0",619,348,20,RGB(green)
GUI BUTTON CVHOMEPAGE,"Return to Home",519,404,250,50,RGB(black),RGB(gold)
GUI CAPTION #29,"BTN1",31,89,"LT",RGB(white),RGB(black)
GUI CAPTION #30,"BTN2",31,216,"LT",RGB(white),RGB(black)
GUI CAPTION #31,"POT1",31,333,"LT",RGB(white),RGB(black)
INIT() '' Calls INIT in code file.
CtrlVal(BTN1_NONE) = 1
CtrlVal(BTN1_LED1) = 0
CtrlVal(BTN1_LED2) = 0
CtrlVal(BTN2_NONE) = 1
CtrlVal(BTN2_LED1) = 0
CtrlVal(BTN2_LED2) = 0
CtrlVal(POT1_NONE) = 1
CtrlVal(POT1_20) = 0
CtrlVal(POT1_25) = 0
CtrlVal(POT1_30) = 0
DO
CtrlVal(CVBTN1) = showPress(btn1) 
CtrlVal(CVBTN2) = ShowPress(btn2) 
CtrlVal(CVPOT1) = str$(pot1,4,2) 
CtrlVal(CVLED1) = ShowOnOff(led1) 
CtrlVal(CVLED2) = ShowOnOff(led2) 
MAIN()  ' Calls MAIN in code file.
CPU SLEEP 0.1
LOOP
'Code File:InfoTwoPageCode.txt
''
Sub INIT()
    Const FALSE = 0
    Const TRUE = 1
    SetPin GP17, DIN
    SetPin GP21, DIN
    SetPin GP26, AIN
    SetPin GP27, DOUT
    SetPin GP28, DOUT
    ''
    btn1_action = 0
    btn2_action = 0
    btn3_action = 0
    limit = 4
End Sub
'' 
Sub Devices()
    btn1=Pin(GP17)
    btn2=Pin(GP21)
    pot1=Pin(GP26)
    led1=Pin(GP27)
    led2=Pin(GP28)
End sub

Sub MAIN()
    if Touch(REF) = CVNEXTPAGE then Page 2
    if Touch(REF) = CVHOMEPAGE then Page 1
    Devices()
    UpdateRadioBtn()
    DeviceUpdate()
    Action()
End Sub

Sub Action()
    if pot1_action > 0 then
        btn1_action = 0
        btn2_action = 0
        CtrlVal(BTN1_NONE) = 1
        CtrlVal(BTN2_NONE) = 1
        GUI DISABLE BTN1_NONE,BTN1_LED1,BTN1_LED2
        GUI DISABLE BTN2_NONE,BTN2_LED1,BTN2_LED2
    else
        GUI ENABLE BTN1_NONE,BTN1_LED1,BTN1_LED2
        GUI ENABLE BTN2_NONE,BTN2_LED1,BTN2_LED2
    endif
End Sub

Sub UpdateRadioBtn()
    if Touch(REF) = BTN1_NONE then btn1_action = 0
    if Touch(REF) = BTN1_LED1 then btn1_action = 1
    if Touch(REF) = BTN1_LED2 then btn1_action = 2
    if Touch(REF) = BTN2_NONE then btn2_action = 0
    if Touch(REF) = BTN2_LED1 then btn2_action = 1
    if Touch(REF) = BTN2_LED2 then btn2_action = 2
    if Touch(REF) = POT1_NONE then pot1_action = 0
    if Touch(REF) = POT1_20 then pot1_action = 1
    if Touch(REF) = POT1_25 then pot1_action = 2
    if Touch(REF) = POT1_30 then pot1_action = 3
    'print btn1_action,btn2_action,pot1_action
End Sub

Sub DeviceUpdate()
    if btn1 = 0 then
        Perform_BTN1(1)
    else
        Perform_BTN1(0)
    endif
    if btn2 = 0 then
        Perform_BTN2(1)
    else
        Perform_BTN2(0)
    endif
    if pot1_action > 0 then
        SetLimit_POT1()
        CtrlVal(#10) = str$(pot1,4,2)
    endif
End Sub

Sub Perform_BTN1(val)
    Select Case btn1_action
        Case 0
            'do nothing
        Case 1
            Pin(GP27) = val
        Case 2
            Pin(GP28) = val
    End Select
End Sub

Sub Perform_BTN2(val)
    Select Case btn2_action
        Case 0
            'do nothing
        Case 1
            Pin(GP27) = val
        Case 2
            Pin(GP28) = val
    End Select
End Sub

Sub SetLimit_POT1(val)
    Select Case pot1_action
        Case 0
            limit = 4.0
        Case 1
            limit = 2.0
        Case 2
            limit = 2.5
        Case 3
            limit = 3.0
    End Select
    if pot1 >= limit then
        Pin(GP28) = 1
        GUI FColour RGB(pink),CVPOT1
    else
        Pin(GP28) = 0
        GUI FColour RGB(white),CVPOT1
    endif
End Sub

Function ShowPress(val) as String
    if val = 0 then ShowPress = "Pressed"
    if val = 1 then ShowPress = "-------"
End Function

Function ShowOnOff(val) as String
    if val = 1 then ShowOnOff = "ON"
    if val = 0 then ShowOnOff = "OFF"
End Function
