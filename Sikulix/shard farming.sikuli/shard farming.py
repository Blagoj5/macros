Settings.AutoDetectKeyboardLayout = False
attackToggleAccOne = Region(Region(218,960,88,72))
attackToggleAccTwo = Region(Region(1192,956,82,74))

msgErrorBoxAccOneTest = Region(Region(12,378,384,244))
msgErrorBoxAccTwoTest = Region(Region(981,251,352,270))
radar = Region(Region(758,247,123,69))
def attackWarden(nthTime):
    if nthTime == 0 or nthTime == 3:
        ''' heal 21212 '''
        type(Key.TAB)
        type("+")
        sleep(0.5)
        type("6", KeyModifier.CTRL)
        sleep(1)
        type("2")
        sleep(1)
        type("5", KeyModifier.CTRL)
        sleep(1)
        type("4")
        sleep(1)
        ''' aoe bleed 3232 '''
        type("3")
        sleep(1)
        type("1", KeyModifier.CTRL)
        sleep(0.5)
        type("e")
        sleep(0.5)
        type("4") 
    elif nthTime == 1 or nthTime == 4:
        ''' aoe bleed 323 '''
        type("2", KeyModifier.CTRL)
        sleep(1)
        type("r")
        sleep(1)
        type("4")
    else:
        ''' spear bleed 3131 '''
        type("3")
        sleep(1)
        type("3", KeyModifier.CTRL)
        sleep(1)
        type("q")
        sleep(1)
        type("4")

    

def attackCappy(nthTime):
    if nthTime == 0 or nthTime == 3:
        type(Key.TAB)
        type("1", KeyModifier.CTRL)
        sleep(1.5)
        type("1")
        sleep(1.5)
        type("2")
        sleep(2)
        type("4")
        sleep(0.6)
        type("q")
        sleep(1.5)
        type("6")
    elif nthTime == 1 or nthTime == 4:
        type("2", KeyModifier.CTRL)
        sleep(1.5)
        type("5", KeyModifier.CTRL)
        sleep(1.5)
        type("5")
        sleep(2)
        type("4")
        sleep(0.6)
        type("q")
        sleep(1.5)
        type("6")
    else:
        type("6", KeyModifier.CTRL)
        sleep(2)
        type("3", KeyModifier.CTRL)
        sleep(2)
        type("4", KeyModifier.CTRL)
    

def turnAround():
    keyDown(Key.RIGHT)
    sleep(1)
    keyUp(Key.RIGHT)
    type("u")

def checkRadar(currentLocation):
    if radar.exists(Pattern("1586521106235.png").exact(), 0):
        click(Location(471, 496))
        keyDown("s")
        wait(7)
        keyUp("s")
        click(currentLocation)

    
def findShards(location, attackToggle, attackTogglePatternActive, attackTogglePatternActiveTwo, attackTogglePatternDeactive, attackClass, msgError):
    click(location)

    for i in range(0,1):
        checkRadar(location)        
        if attackToggle.exists(attackTogglePatternActive, 0) or attackToggle.exists(attackTogglePatternActiveTwo, 0):
            howManyAttack = 0
            while(True):
                '''
                   THE CHARACTERS MUST LOOK UP!! For this to work
                '''
                type(Key.TAB)
                attackClass(howManyAttack)
                checkRadar(location)
                if attackToggle.exists(attackTogglePatternDeactive, 2) or howManyAttack == 5:
                    break
                howManyAttack = howManyAttack + 1
        '''
           If its the first acc nd goes out of bonds skip the select
        '''

        type("v")
        wait(0.3)
        type("u")
        if msgError.exists(Pattern("1586133232245-1.png").similar(0.69),0.5) or msgError.exists("1586135237300-1.png", 0):
            keyDown(Key.LEFT)
            sleep(0.4)
            keyUp(Key.LEFT)
        
        if msgError.exists(Pattern("1586133795162-1.png").similar(0.74), 0.5):
            turnAround()
           

while(True):
    '''
        weaker macro without corpse
    '''
    '''
       Activate account one, Do the script
    '''
    
    findShards(Location(471, 496), attackToggleAccOne, "1586181739997-1.png", "1586211653840.png", Pattern("1586207069969.png").similar(0.80), attackWarden, msgErrorBoxAccOneTest)
    

    '''
       Activate account two, Do the script
    '''
    findShards(Location(1431, 477), attackToggleAccTwo, "1586181739997-1.png", "1586211653840.png", Pattern("1586207069969.png").similar(0.80), attackCappy, msgErrorBoxAccTwoTest)



    

