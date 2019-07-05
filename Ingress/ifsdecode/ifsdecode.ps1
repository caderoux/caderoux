[CmdletBinding()]

Param(
    [String]$hint = 'Hexadecimal' # Phone Keyboard, Phonetic, Hexadecimal
	,[String]$enl = ''
    ,[String]$res = ''
    ,[switch]$demo = $false
)

$demos = @{
    "Phone Keyboard" = @{ enl = '[7777.888.999.66.444.66.33.333.666.88.777.444.333.7]'; res = '[777.66.444.66.33.33.444.4.44.8.66.444.66.33.9999.22]'};
    "Phonetic" = @{ enl = '[Sierra Whiskey Hotel Sierra Echo Victor Echo November Tango Whiskey Oscar India Foxtrot Sierra Tango Whiskey Oscar Zulu Echo Romeo Oscar Oscar N]'; res = '[ovember Echo November India November Echo November India November Echo Echo India Golf Hotel Tango Sierra Echo Victor Echo November Kilo Foxtrot]'};
    "Hexadecimal" = @{ enl = '[68:73:65:35:33:69:66:73:3]'; res = '[2:30:31:39:38:39:33:62:75]' }
}

if ( $demo ) {
    $enl, $res = $demos[$hint].enl, $demos[$hint].res
}

"ENL >> $enl";
"RES >> $res";

$enl = $enl -replace '[\[\]]', '';
$res = $res -replace '[\[\]]', '';
$code = "$enl$res";
"CIPHERTEXT >> $code";

function Decode-PhonePad() {
    param($code, $delimiter);

    $phonepad = @{
        '2' = 'A'; '22' = 'B'; '222' = 'C';
        '3' = 'D'; '33' = 'E'; '333' = 'F';
        '4' = 'G'; '44' = 'H'; '444' = 'I';
        '5' = 'J'; '55' = 'K'; '555' = 'L';
        '6' = 'M'; '66' = 'N'; '666' = 'O';
        '7' = 'P'; '77' = 'Q'; '777' = 'R'; '7777' = 'S';
        '8' = 'T'; '88' = 'U'; '888' = 'V';
        '9' = 'W'; '99' = 'X'; '999' = 'Y'; '9999' = 'Z';
    };

    ($code -split [regex]::Escape($delimiter) | % { $phonepad[$_] }) -join $delimiter;
}

function Decode-Phonetic() {
    param($code)

    $code -creplace '[a-z\-]', ''
}

function Decode-Hexadecimal() {
    param ($code, $delimiter)

    ($code -split [regex]::Escape($delimiter) | % { [char][byte]"0x$_" }) -join $delimiter;
}

function Decode-RemoveDelimiters() {
    param($code, $delimiter);

    $code -replace [regex]::Escape($delimiter), '';
}

function Decode-WordNumbers() {
    param($code);
    $wordnumbers = @{ 'ZERO' = '0'; 'ONE' = '1'; 'TWO' = '2'; 'THREE' = '3'; 'FOUR' = '4'; 'FIVE' = '5'; 'SIX' = '6'; 'SEVEN' = '7'; 'EIGHT' = '8'; 'NINE' = '9'; };

    $wordnumbers.keys | % { $code = $code -replace $_, $wordnumbers[$_] };

    $code;
}

if ( $hint -eq 'Phone Keyboard' ) {
    $code = Decode-PhonePad -code $code -delimiter '.';
    "PLAINTEXT (PhonePad) >> $code";
    
    $code = Decode-RemoveDelimiters -code $code -delimiter '.';
    "PLAINTEXT (RemoveDelimiters) >> $code";
}
elseif ( $hint -eq 'Phonetic' ) {
    $code = Decode-Phonetic -code $code;
    "PLAINTEXT (Phonetic) >> $code";
    
    $code = Decode-RemoveDelimiters -code $code -delimiter ' ';
    "PLAINTEXT (RemoveDelimiters) >> $code";
}
elseif ( $hint -eq 'Hexadecimal' ) {
    $code = Decode-Hexadecimal -code $code -delimiter ':';
    "PLAINTEXT (Hexadecimal) >> $code";
    
    $code = Decode-RemoveDelimiters -code $code -delimiter ':';
    "PLAINTEXT (RemoveDelimiters) >> $code";
}

$code = Decode-WordNumbers -code $code;
"PASSCODE >> $code";
