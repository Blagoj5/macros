#Include C:\Users\baze_\OneDrive\Desktop\shard farming.sikuli\farmShardAHK\FindText.ahk

MButton::
  Send, {MButton}
  t1:=A_TickCount, X:=Y:=""

  Text:="|<>*68$20.zzzzzzzk0Ds/1w6MD1a3ktkwSSD7bXltwwyzDDynnPgxqPjtyTyTrzzzzzzzzzzs"

  if (ok:=FindText(540-150000, 826-150000, 540+150000, 826+150000, 0, 0, Text))
  {
    CoordMode, Mouse
    X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
    ; Click, %X%, %Y%
  }

  MsgBox, 4096, Tip, % "Found :`t" Round(ok.MaxIndex())
    . "`n`nTime  :`t" (A_TickCount-t1) " ms"
    . "`n`nPos   :`t" X ", " Y
    . "`n`nResult:`t" (ok ? "Success !" : "Failed !")

  for i,v in ok
    if (i<=2)
      MouseTip(ok[i].x, ok[i].y)
  return
