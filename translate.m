function translated = translate(stringToBeTranslated, toLanguage, fromLanguage)
%TRANSLATE uses Google(r)'s free web service at translate.google.com to translate
%a string from one language to another. 
%
%   Usage:
%       translate('thank you', 'ja') - translates the first argument to Japanese
%       translate('merci', 'ja', 'fr') - translate the first argument from french to Japanese 
%       translate('thank you') - translate the first argument from English to German 
%
%   Inputs:
%       Arg1: stringToBeTranslated - char array or cell array of strings to be translated
%               - Required
%       Arg2: toLanguage - Language to be which 'stringToBeTranslated' will be translated 
%               - Optional
%               - Default - 'de'(German)
%       Arg3: fromLanguage - Language in which 'stringToBeTranslated' is specified
%               - Optional
%               - Default - 'en'(English)
%
%   Output: Translated string returned by Google(r)
%           Output is of the same type as the input 'stringToBeTranslated' - Char array or cell array of string
%           Output is not translated if internet is not available of something went wrong with the query to Google(r).
%
%   See also googleTranslateExample

%   Copyright 2013-2015 The MathWorks, Inc.
%   Written: 28-Jun-2013 , Varun Gandhi

narginchk(1,3);
if nargin == 1    
    toLanguage = 'de';
    fromLanguage = 'en';
end
if nargin == 2
    fromLanguage = 'en';
end

if iscell(stringToBeTranslated)
    for k = 1:length(stringToBeTranslated)
        translated{k} = translate(stringToBeTranslated{k}, toLanguage, fromLanguage); %#ok<AGROW>
    end
elseif ischar(stringToBeTranslated)
    translated = translateCharArray(stringToBeTranslated, toLanguage, fromLanguage);
else
    error('Invalid input type, must be a Char array or a Cell arrray of strings');
end     
    

end

function translatedString = translateCharArray(str, toLanguage, fromLanguage)

% Split new lines to do separate translations. Google does it this way as too.
[splitStr, splitMatch] = strsplit(str, {'\r','\n'});

translatedString = queryGoogleTranslate(splitStr{1});

for k = 2:length(splitStr)
    translatedString = sprintf('%s%s%s',translatedString, splitMatch{k-1}, queryGoogleTranslate(splitStr{k}));
end

    function xLatedString = queryGoogleTranslate(str)
        url = sprintf('https://translate.google.com/translate_a/t?client=t&text=%s&hl=%s&sl=%s&tl=%s&ie=UTF-8&oe=UTF-8&multires=1&otf=1&pc=1&trs=1&ssel=3&tsel=6&sc=1' , ...
            char(java.net.URLEncoder.encode(str,'utf-8')), fromLanguage, fromLanguage, toLanguage);        
        try 
            urlReturn = urlread(url);
            sp = strsplit(urlReturn,'"');
            xLatedString = sp{2};
        catch
            xLatedString = str;
        end
                    
    end
end

