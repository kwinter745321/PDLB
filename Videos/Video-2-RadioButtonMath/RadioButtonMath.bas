'Pico Display Layout Builder v1.0
'PicoMite v5.07
'Control layout configured: 2024-09-20 14:30:48.
'
GUI DELETE ALL
cls RGB(black) 
COLOUR RGB(white), RGB(black) 
FONT 3,1
CONST VALUEA = 1  'a CntrlVal name
CONST VALUEB = 2  'a CntrlVal name
CONST RBADD = 4  'a CntrlVal name
CONST RBMULT = 5  'a CntrlVal name
CONST TOTAL = 6  'a CntrlVal name
GUI NUMBERBOX VALUEA,66,183,100,40,RGB(cyan),RGB(black)
GUI NUMBERBOX VALUEB,66,254,100,40,RGB(cyan),RGB(black)
GUI FRAME #3,"Operation",237,122,280,250,RGB(cyan)
GUI RADIO RBADD,"Add",286,190,20,RGB(green)
GUI RADIO RBMULT,"Multiply",291,279,20,RGB(green)
GUI DISPLAYBOX TOTAL,627,210,150,40,RGB(cyan),RGB(black)
GUI CAPTION #7,"A",37,196,"LT",RGB(white),RGB(black)
GUI CAPTION #8,"B",37,269,"LT",RGB(white),RGB(black)
GUI CAPTION #9,"Total",547,227,"LT",RGB(white),RGB(black)
GUI CAPTION #10,"RadioButton Math",266,42,"LT",RGB(white),RGB(black)
INIT() '' Calls INIT in code file.
CtrlVal(VALUEA) = 2
CtrlVal(VALUEB) = 3
CtrlVal(RBADD) = 1
CtrlVal(RBMULT) = 0
DO
CtrlVal(TOTAL) = str$(sum) 
MAIN()  ' Calls MAIN in code file.
CPU SLEEP 0.1
LOOP
''Code File:RadioButtonMathCode.txt
''
Sub INIT()
    sum = 0
End Sub
''
Sub MAIN()
    sum = PICK(CtrlVal(RBADD),CtrlVal(RBMULT))
End Sub
''
FUNCTION ADD(A,B)
    ADD = A + B
END FUNCTION
''
FUNCTION MULT(A,B)
    MULT = A * B
END FUNCTION
''
FUNCTION PICK(op1%,op2%)
    PICK = 0
    IF op1% = 1 THEN
        PICK=ADD(CtrlVal(VALUEA),CtrlVal(VALUEB))
    ENDIF
    IF op2% = 1 THEN 
        PICK=MULT(CtrlVal(VALUEA),CtrlVal(VALUEB))
    ENDIF
END FUNCTION


