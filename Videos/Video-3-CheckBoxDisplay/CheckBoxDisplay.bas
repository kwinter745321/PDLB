'Pico Display Layout Builder v1.0
'PicoMite v5.07
'Control layout configured: 2024-09-23 09:51:56.
'
GUI DELETE ALL
cls RGB(black) 
COLOUR RGB(white), RGB(black) 
FONT 3,1
GUI FRAME #1,"Checkbox Demo",255,104,300,244,RGB(cyan)
GUI CHECKBOX #2,"CB1",310,158,30,RGB(white)
GUI CHECKBOX #3,"CB2",310,218,30,RGB(white)
GUI CHECKBOX #4,"CB3",308,276,30,RGB(white)
GUI DISPLAYBOX #5,255,416,300,40,RGB(cyan),RGB(black)
GUI CAPTION #6,"Click any checkbox.",254,37,"LT",RGB(white),RGB(black)
GUI CAPTION #7,"Display items checked:",257,373,"LT",RGB(white),RGB(black)
INIT() '' Calls INIT in code file.
CtrlVal(#2) = 0
CtrlVal(#3) = 0
CtrlVal(#4) = 0
DO
CtrlVal(#5) = msg$
MAIN()  ' Calls MAIN in code file.
CPU SLEEP 0.1
LOOP
''Code File:CheckBoxDisplayCode.txt
''
Sub INIT()
End Sub
''
Sub MAIN()
  msg$ = ""
  if CtrlVal(#2) = 1 then msg$ = msg$ + "CB1 "
  if CtrlVal(#3) = 1 then msg$ = msg$ + "CB2 "
  if CtrlVal(#4) = 1 then msg$ = msg$ + "CB3 "
End Sub

