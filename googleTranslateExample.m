function f = googleTranslateExample
% GOOGLETRANSLATEEXAMPLE simple app to demonstrate the use of translate
% utility.
%
% See also translate

% Copyright 2013-2015 The MathWorks, Inc.
% Written: 28-Jun-2013 , Varun Gandhi

f = figure('Name', 'Translate English Strings', 'Menubar', 'none', 'Toolbar', 'none');

langs = {'French', 'German', 'Japanese', 'Chinese', 'Korean', ...
    'Arabic', 'Spanish', 'Hindi', 'Russian', 'Hebrew', 'Portugese'};
langID = {'fr', 'de', 'ja', 'zh', 'ko', 'ar', 'es', 'hi', 'ru', 'iw', 'pt'};
numLangs = length(langs);

topPanel = uipanel(f, 'Position', [0 .9 1 .1]);
e = uicontrol(topPanel, 'Style', 'edit', ...
    'Callback', @(o,e) editCB(o,e), 'String', 'Hello MATLAB', ...
    'Units', 'normalized', 'Position', [.2 0 .8 1]);
elabel = uicontrol(topPanel, 'Style', 'text', 'String', 'Enter text in English:', ...
    'Units', 'normalized', 'Position', [0 0 .2 1]);

u = uipanel(f, 'Position', [0.2 0 .8 .9], 'BorderType', 'none');
hStr = gobjects(1,numLangs);
for k = 1:numLangs
    hStr(k) = uicontrol(u, 'Style', 'text', 'Units', 'normalized', ...
        'Position', [0 (numLangs-k)/numLangs 1 1/numLangs]);
end

ul = uipanel(f, 'Position', [0 0 .2 .9], 'BorderType', 'none');
hLabel = gobjects(1,numLangs);
for k = 1:numLangs
    hLabel(k) = uicontrol(ul, 'Style', 'text', ...
        'String', [langs{k} ' (' langID{k} '):'], 'Units', 'normalized', ...
        'Position', [0 (numLangs-k)/numLangs 1 1/numLangs]);
end

% Set common properties
set([hStr hLabel elabel e], 'FontUnits', 'pixels', 'FontSize', 12);

editCB(e,[]);


    function editCB(o,~)
        currentStr = o.String;
        updateTranslations(currentStr);
    end

    function updateTranslations(currentStr)
        for l = 1:numLangs
            hStr(l).String = translate(currentStr, langID{l});
        end
        drawnow;
    end

end


