Param(
	[String]$enl_code = '[7777.888.999.66.444.66.33.333.666.88.777.444.333.7]'
	,[String]$res_code = '[777.66.444.66.33.33.444.4.44.8.66.444.66.33.9999.22]'
)

"ENL >> $enl_code";
"RES >> $res_code";

$enl_code = $enl_code -replace '\[', '' -replace '\]', '';
$res_code = $res_code -replace '\[', '' -replace '\]', '';

$code = "$enl_code$res_code";
"COMBINED CIPHERTEXT >> $code";

function Decode-PhonePad() {
    param($code);

    $phonepad = @{
        '2' = 'A';
        '22' = 'B';
        '222' = 'C';
        '3' = 'D';
        '33' = 'E';
        '333' = 'F';
        '4' = 'G';
        '44' = 'H';
        '444' = 'I';
        '5' = 'J';
        '55' = 'K';
        '555' = 'L';
        '6' = 'M';
        '66' = 'N';
        '666' = 'O';
        '7' = 'P';
        '77' = 'Q';
        '777' = 'R';
        '7777' = 'S';
        '8' = 'T';
        '88' = 'U';
        '888' = 'V';
        '9' = 'W';
        '99' = 'X';
        '999' = 'Y';
        '9999' = 'Z';
    };

    $chars = $code -split '\.'
    for ($lp = 0 ; $lp -lt $chars.Count ; $lp++) {
        $chars[$lp] = $phonepad[$chars[$lp]];
    }
    return $chars -join "";
}

function Decode-WordNumbers() {
    param($code);
    $wordnumbers = @{
        'ONE' = '1';
        'TWO' = '2';
        'THREE' = '3';
        'FOUR' = '4';
        'FIVE' = '5';
        'SIX' = '6';
        'SEVEN' = '7';
        'EIGHT' = '8';
        'NINE' = '9';
    };

    foreach($key in $wordnumbers.keys)
    {
        $code = $code -replace "$key", $wordnumbers[$key];
    }
    return $code;
}

$code = Decode-PhonePad($code);
"PLAINTEXT >> $code";

$code = Decode-WordNumbers($code);
"PASSCODE: $code";
