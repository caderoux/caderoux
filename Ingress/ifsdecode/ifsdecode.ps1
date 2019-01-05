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

$phonepad = @{};
$phonepad['2'] = 'A';
$phonepad['22'] = 'B';
$phonepad['222'] = 'C';
$phonepad['3'] = 'D';
$phonepad['33'] = 'E';
$phonepad['333'] = 'F';
$phonepad['4'] = 'G';
$phonepad['44'] = 'H';
$phonepad['444'] = 'I';
$phonepad['5'] = 'J';
$phonepad['55'] = 'K';
$phonepad['555'] = 'L';
$phonepad['6'] = 'M';
$phonepad['66'] = 'N';
$phonepad['666'] = 'O';
$phonepad['7'] = 'P';
$phonepad['77'] = 'Q';
$phonepad['777'] = 'R';
$phonepad['7777'] = 'S';
$phonepad['8'] = 'T';
$phonepad['88'] = 'U';
$phonepad['888'] = 'V';
$phonepad['9'] = 'W';
$phonepad['99'] = 'X';
$phonepad['999'] = 'Y';
$phonepad['9999'] = 'Z';

$wordnumbers = @{};
$wordnumbers['ONE'] = '1';
$wordnumbers['TWO'] = '2';
$wordnumbers['THREE'] = '3';
$wordnumbers['FOUR'] = '4';
$wordnumbers['FIVE'] = '5';
$wordnumbers['SIX'] = '6';
$wordnumbers['SEVEN'] = '7';
$wordnumbers['EIGHT'] = '8';
$wordnumbers['NINE'] = '9';

function Decode-PhonePad() {
    param($code);
    $chars = $code -split '\.'
    for ($lp = 0 ; $lp -lt $chars.Count ; $lp++) {
        $chars[$lp] = $phonepad[$chars[$lp]];
    }
    return $chars -join "";
}

function Decode-WordNumbers() {
    param($code);
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
