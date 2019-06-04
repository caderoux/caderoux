Demo Usage

    .\ifsdecode.ps1 -demo -hint 'Phone Keyboard'
    
    .\ifsdecode.ps1 -demo -hint 'Phonetic'
    
    .\ifsdecode.ps1 -demo -hint 'Hexadecimal'

Sample Output

    ENL >> [7777.888.999.66.444.66.33.333.666.88.777.444.333.7]
    RES >> [777.66.444.66.33.33.444.4.44.8.66.444.66.33.9999.22]
    CIPHERTEXT >> 7777.888.999.66.444.66.33.333.666.88.777.444.333.7777.66.444.66.33.33.444.4.44.8.66.444.66.33.9999.22
    PLAINTEXT (PhonePad) >> S.V.Y.N.I.N.E.F.O.U.R.I.F.S.N.I.N.E.E.I.G.H.T.N.I.N.E.Z.B
    PLAINTEXT (RemoveDelimiters) >> SVYNINEFOURIFSNINEEIGHTNINEZB
    PASSCODE >> SVY94IFS989ZB
    
    ENL >> [Sierra Whiskey Hotel Sierra Echo Victor Echo November Tango Whiskey Oscar India Foxtrot Sierra Tango Whiskey Oscar Zulu Echo Romeo Oscar Oscar N]
    RES >> [ovember Echo November India November Echo November India November Echo Echo India Golf Hotel Tango Sierra Echo Victor Echo November Kilo Foxtrot]
    CIPHERTEXT >> Sierra Whiskey Hotel Sierra Echo Victor Echo November Tango Whiskey Oscar India Foxtrot Sierra Tango Whiskey Oscar Zulu Echo Romeo Oscar Oscar November Echo November India November Echo November India November Echo Echo India Golf Hotel Tango Sierra Echo Victor Echo November Kilo Foxtrot
    PLAINTEXT (Phonetic) >> S W H S E V E N T W O I F S T W O Z E R O O N E N I N E N I N E E I G H T S E V E N K F
    PLAINTEXT (RemoveDelimiters) >> SWHSEVENTWOIFSTWOZEROONENINENINEEIGHTSEVENKF
    PASSCODE >> SWH72IFS2019987KF
    
    ENL >> [68:73:65:35:33:69:66:73:3]
    RES >> [2:30:31:39:38:39:33:62:75]
    CIPHERTEXT >> 68:73:65:35:33:69:66:73:32:30:31:39:38:39:33:62:75
    PLAINTEXT (Hexadecimal) >> h:s:e:5:3:i:f:s:2:0:1:9:8:9:3:b:u
    PLAINTEXT (RemoveDelimiters) >> hse53ifs2019893bu
    PASSCODE >> hse53ifs2019893bu
    
Usage

    .\ifsdecode.ps1 -hint Hexadecimal -enl [68:73:65:35:33:69:66:73:3] -res [2:30:31:39:38:39:33:62:75]
    
Output

    ENL >> [68:73:65:35:33:69:66:73:3]
    RES >> [2:30:31:39:38:39:33:62:75]
    CIPHERTEXT >> 68:73:65:35:33:69:66:73:32:30:31:39:38:39:33:62:75
    PLAINTEXT (Hexadecimal) >> h:s:e:5:3:i:f:s:2:0:1:9:8:9:3:b:u
    PLAINTEXT (RemoveDelimiters) >> hse53ifs2019893bu
    PASSCODE >> hse53ifs2019893bu
