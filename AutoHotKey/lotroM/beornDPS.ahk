﻿; #IfWinActive ahk_exe lotroclient64.exe
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
        if (skill = "XButton1" || skill = "XButton2") {
            Sleep, 100
            Loop, 2 {
                Send, {%skill%}
                Sleep, 100
            }
        } else if (skill != "") {
            Sleep, 100
            Send, {%skill%}
        }

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

    ; ; This button switches while transforming
    XButton1::
        ; switchWeapons(A_ThisHotkey ,"^"slotSeven, "^"slotEight, "^"slotNine) IT TAKES LONGER TO RESPOND
        ; switchWeapons("XButton1", "^"slotSeven, "^"slotEight, "^"slotNine)
        switchWeapons("XButton1" ,"+"slotEight, "!"slotSeven, "!"slotEight)


    return

    ; This button switches the right weapons on the right bar, in case they get messed up
    XButton2::
        ; Suspend, Off 
        switchWeapons("XButton2" ,"+"slotEight, "!"slotNine)
    return

    $5::
        switchWeapons(5, "!"slotNine)   
    Return

    ; Use the RUSH LONGER [add the carving that gives movment speed duration to rush] SHIFT+6 Rush Carving
    $+4::
        switchWeaponsUseSkill("+"4, "+"slotSeven, , , "+"slotEight, , , 300 )

    Return

    ; ; Use the RUSH LONGER [add the carving that gives movment speed duration to rush] SHIFT+6 Rush Carving
    ; $q::
    ;     switchWeaponsUseSkill("q", "+"slotNine, , ,slotSeven, slotEight, , , 300) 
    ; Return

    ; ; Use the RUSH LONGER [add the carving that gives movment speed duration to rush] SHIFT+6 Rush Carving
    ; $r::
    ;     switchWeaponsUseSkill("r", "+"slotNine, , ,slotSeven, slotEight, , , 300) 
    ; Return




    ; switchWeaponsUseSkill(skill ,slotOne, slotTwo, slotThree, returnSlotOne, returnSlotTwo, returnSlotThree, waitSkill, waitWeapon)
    Ctrl & Shift::Suspend, Toggle
    
; }

