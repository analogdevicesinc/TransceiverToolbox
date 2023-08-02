classdef Step3 < adi.StepBase

    %   Copyright 2017 The MathWorks, Inc.

    methods

        function obj = Step3(varargin)
            obj@adi.StepBase(varargin{:});

            %       obj.Workflow.InstallDriverWorkflow = true;

            obj.Title.Text = 'ADI Board Support Package Installer: Step3';

            obj.InfoText1.Position = [20 340 400 30];
            obj.InfoText1.Text = 'Test1: Step3';

            obj.InfoText2.Position = [20 290 400 50];
            obj.InfoText2.Text = 'Test2: Step3';

            obj.HelpText.AboutSelection = 'About Selection: Step3';
            obj.HelpText.WhatToConsider = 'Test3: Step3';
        end

        %         function out = getNextScreenID(obj)
        %             % HSA infrastructure requires a "getNextScreenID" method implemented
        %             % in the leaf class. Otherwise, it renders "Finish" button instead of
        %             % "Next".
        %             out = getNextScreenIDImpl(obj);
        %         end

        function restoreScreen(obj)
            obj.enableScreen();
        end

    end

    methods (Access = protected)

        function out = getNextScreenIDImpl(~)
            out = 'adi.Step3';
        end

    end

end
