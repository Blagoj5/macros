; #IfWinActive ahk_exe lotroclient64.exe
; {

    ; This function switches one, two or three weapons THEN uses skill
    switchWeapons(skill, slotOne, slotTwo:="", slotThree:="", waitWeapon:=100) {
        ; KeyModifier like alt or shift or CTRL [That the skill is on] it goes like KeyModifier + Skill, for every skill or weapon that is set on
        ; skill which skill are you pressing 3, 4, 5 (the number)
        ; wait = is wait time between weapon switch and skill usage [Default 50]

        Send, %slotOne%
        if (slotTwo != "") {
            Sleep, %waitWeapon%
            Send, %slotTwo%
        } 
        if (slotThree != "") {
            Sleep, %waitWeapon%
            Send, %slotThree%
        }
            Sleep, 150
            Send, {CtrlDown}{%skill%}{CtrlUp}

        return
    }

    switchWeaponsUseSkill(skill ,slotOne, slotTwo:="", slotThree:="", returnSlotOne:="", returnSlotTwo:="", returnSlotThree:="", waitSkill:=100, waitWeapon:=100) {
        ; KeyModifier like alt or shift or CTRL [That the skill is on] it goes like KeyModifier + Skill, for every skill or weapon that is set on
        ; skill which skill are you pressing 3, 4, 5 (the number)
        ; wait = is wait time between weapon switch and skill usage [Default 50]

        Send, %slotOne%
        if (slotTwo != "") {
            Sleep, 50
            Send, %slotTwo%
        } 
        if (slotThree != "") {
            Sleep, 50
            Send, %slotThree%
        }
        Sleep, %waitSkill% 

        Send, %Skill%
        Sleep, %waitWeapon% 

        ; Add the previous weapons
        switchWeapons("", returnSlotOne, returnSlotTwo, returnSlotThree)

        return
    }


    ; Define all slots that will the weapons be on
    slotSix := 6 
    slotSeven := 7
    slotEight := 8
    slotNine := 9

    $^e::

        switchWeapons("e", "+"slotNine)

    Return

        $^r::

            switchWeapons("r", "+"slotNine)


    Return


    Ctrl & Shift::Suspend, Toggle
    
; }

