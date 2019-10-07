#!/usr/bin/env node

var args = require("args");

args
    .option("cipher", "Cipher type")
    .option("enl", "ENL half of code")
    .option("res", "RES half of code")
    .option("demo", "Use a demo code");

const flags = args.parse(process.argv);

var demos = {
    PhoneKeyboard : { enl : '[7777.888.999.66.444.66.33.333.666.88.777.444.333.7]', res : '[777.66.444.66.33.33.444.4.44.8.66.444.66.33.9999.22]' }
    ,Phonetic : { enl : '[Sierra Whiskey Hotel Sierra Echo Victor Echo November Tango Whiskey Oscar India Foxtrot Sierra Tango Whiskey Oscar Zulu Echo Romeo Oscar Oscar N]', res : '[ovember Echo November India November Echo November India November Echo Echo India Golf Hotel Tango Sierra Echo Victor Echo November Kilo Foxtrot]' }
    ,Hexadecimal : { enl : '[68:73:65:35:33:69:66:73:3]', res : '[2:30:31:39:38:39:33:62:75]' }
    ,Braille : { enl : '⠙⠚⠋⠎⠑⠧⠑⠝⠎⠊⠭⠊⠋⠎⠞⠺⠕⠵⠑⠗⠕', res : '⠕⠝⠑⠝⠊⠝⠑⠋⠊⠧⠑⠞⠺⠕⠑⠊⠛⠓⠞⠃⠟' }
    ,Decimal : { enl : '[102.100.107.55.56.105.102.115]', res : '[.50.48.49.57.52.53.54.113.110]' }
}

if ( flags.demo == "true" ) {
    enl = demos[flags.cipher].enl;
    res = demos[flags.cipher].res;
}
else {
    enl = flags.enl;
    res = flags.res;
}

console.log(`ENL >> ${enl}`);
console.log(`RES >> ${res}`);

enl = enl.replace(/[\[\]]/g, '');
res = res.replace(/[\[\]]/g, '');
var code = `${enl}${res}`;
console.log(`CIPHERTEXT >> ${code}`);

RegExp.escape = function (string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // $& means the whole matched string
};

function DecodeDecimal(code, delimiter) {
    return code.split(delimiter).map( x => String.fromCharCode(x) ).join(delimiter);
}

function DecodeRemoveDelimiters(code, delimiter) {
    return code.replace(new RegExp(RegExp.escape(delimiter), "g"), "");
}

function DecodeWordNumbers(code) {
    const wordnumbers = [
                            { s: 'ZERO', r: '0' }
                            , { s: 'ONE', r: '1'}
                            , { s: 'TWO', r: '2'}
                            , { s: 'THREE', r: '3'}
                            , { s: 'FOUR', r: '4'}
                            , { s: 'FIVE', r: '5'}
                            , { s: 'SIX', r: '6'}
                            , { s: 'SEVEN', r: '7'}
                            , { s: 'EIGHT', r: '8'}
                            , { s: 'NINE', r: '9'}
                        ];

    wordnumbers.map( x => code = code.replace(x.s, x.r) );

    return code;
}

if ( flags.cipher == "Decimal" ) {
    code = DecodeDecimal(code, '.');
    console.log(`PLAINTEXT (Decimal) >> ${code}`);
    
    code = DecodeRemoveDelimiters(code, '.');
    console.log(`PLAINTEXT (RemoveDelimiters) >> ${code}`);
}

code = DecodeWordNumbers(code);
"PASSCODE >> code";
