function html = customDoc(str)
    % Make sure that we can support the doc command on this platform.
    if ~usejava('mwt')
        error(message('MATLAB:doc:UnsupportedPlatform', upper(mfilename)));
    end

    % Examine the inputs to see what options are selected.
    [showClassicDoc, topic, search, isVariable] = examineInputs(str);
    if isVariable
        varName = inputname(isVariable);
    elseif ~isempty(topic) && nargin == 1
        wsVariables = evalin('caller', 'whos');
        [topic, isVariable, varName] = matlab.internal.help.getClassNameFromWS(topic, wsVariables, true);
    end
    if search
        docsearch(topic);
        return;
    end
    % Check this before checking docroot, the -classic option is used to show doc not under docroot.
    if showClassicDoc
        com.mathworks.mlservices.MLHelpServices.invokeClassicHelpBrowser();
        return;
    end

    % Make sure docroot is valid.
    if ~matlab.internal.help.isDocInstalled
        % If m-file help is available for this topic, call helpwin.
        if ~isempty(topic)
            if showHelpwin(topic)
                return;
            end
        end

        % Otherwise show the appropriate error page.
        htmlFile = fullfile(matlabroot,'toolbox','local','helperr.html');

        if exist(htmlFile, 'file') ~= 2
            error(message('MATLAB:doc:HelpErrorPageNotFound', htmlFile));
        end
        displayFile(htmlFile);
        return;
    end

    % Case no topic specified.
    if isempty(topic)
        % Just open the help browser and display the default startup page.
        com.mathworks.mlservices.MLHelpServices.invoke();
        return;
    end
    
    if strncmpi(topic, 'mupad/', 6)
        if ~mupaddoc(topic)
            showNoReferencePageFound;
        end
        return;
    end
    
    [operator,topic] = matlab.internal.language.introspective.isOperator(topic);
    if ~operator
        if topic(end) == '/'
            topic = topic(1:end-1);
        end

        if showProductPage(topic)
            return;
        end
        
        [possibleTopics, isPrimitive] = matlab.internal.help.resolveDocTopic(topic, isVariable);
        
        if isPrimitive
            disp(matlab.internal.help.getInstanceIsa(varName, topic));
            return;
        end
    else
        [~,possibleTopics.topic] = fileparts(topic);
        possibleTopics.isElement = false;
    end
    
    [foundTopic, html] = showHelpwin(topic);
    if ~displayDocPage(possibleTopics) && ~foundTopic
        docsearch(topic);
    end
end

function [showClassicDoc, topic, search, varIndex] = examineInputs(str)
    showClassicDoc = 0;
    topic = [];
    search = 0;
    varIndex = 0;

    % for i = 1:numel(str)
        argName = str; % str{i};
        if isstring(argName)
            if ~isscalar(argName)
                MException(message('MATLAB:doc:MustBeSingleString')).throwAsCaller;
            end
            argName = char(strip(argName));
        elseif ischar(argName)
            argName = strtrim(argName);
        else
            argName = class(argName);
            % varIndex = i;
        end

        if strcmp(argName, '-classic')
            showClassicDoc = 1;
        else
            % assume this is the location.
            if ~isempty(topic)
                topic = sprintf('%s %s', topic, argName);
                search = 1;
            else
                topic = argName;
            end
        end
    % end
end
    
function success = showProductPage(topic)
    success = com.mathworks.mlservices.MLHelpServices.showProductPage(topic);
end

function success = displayDocPage(possibleTopics)
    success = false;
    for topic = possibleTopics
        if com.mathworks.mlservices.MLHelpServices.showReferencePage(topic.topic, topic.isElement)
            success = true;
            return;
        end
    end

    for topic = possibleTopics
        if matlab.internal.doc.isLiveCodeAndHasDocumentation(topic.topic)
            internal.help.livecodedoc.mlxdoc(topic.topic);
            success = true;
            return;
        end
    end
end
   
function [foundTopic, html] = showHelpwin(topic)
    % turn off the warning message about helpwin being removed in a future
    % release
    s = warning('off', 'MATLAB:helpwin:FunctionToBeRemoved');
    [foundTopic, html] = customHelpwin(topic, '', '', '-doc');
    
    % turn the warning message back on if it was on to begin with
    warning(s.state, 'MATLAB:helpwin:FunctionToBeRemoved');
end

function showNoReferencePageFound(topic)
    noFuncPage = matlab.internal.help.underDocroot('nofunc.html');
    if ~isempty(noFuncPage)
        displayFile(noFuncPage);
    else
        error(message('MATLAB:doc:InvalidTopic', topic));
    end
end

function displayFile(htmlFile)
    % Display the file inside the help browser.
    web(htmlFile, '-helpbrowser');
end
