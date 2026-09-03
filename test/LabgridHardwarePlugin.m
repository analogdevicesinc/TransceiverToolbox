classdef LabgridHardwarePlugin < matlab.unittest.plugins.TestRunnerPlugin
    % LABGRIDHARDWAREPLUGIN MATLAB unittest TestRunnerPlugin for Labgrid HW testing.
    %
    % This plugin detects and configures labgrid-managed hardware targets for
    % MATLAB unit tests. It extracts target URIs from environment variables
    % (e.g. IIO_URI, LG_PLACE, LG_CARRIER) exported during `adi-lg request`,
    % logs place metadata, and ensures test instances target the active board.

    properties
        URI
        Place
        Carrier
    end

    methods
        function plugin = LabgridHardwarePlugin(customURI)
            if nargin > 0 && ~isempty(customURI)
                plugin.URI = customURI;
            else
                plugin.URI = getenv('IIO_URI');
            end
            plugin.Place = getenv('LG_PLACE');
            plugin.Carrier = getenv('LG_CARRIER');
        end
    end

    methods (Access = protected)
        function instance = createTestClassInstance(plugin, pluginData)
            % Invoke superclass method to create instance
            instance = createTestClassInstance@matlab.unittest.plugins.TestRunnerPlugin(plugin, pluginData);

            % Apply Labgrid hardware settings if instance is a HardwareTests class
            if isa(instance, 'HardwareTests') || isprop(instance, 'uri')
                if ~isempty(plugin.URI)
                    fprintf('[LabgridPlugin] Injecting URI: %s into %s\n', plugin.URI, class(instance));
                    instance.uri = plugin.URI;
                end
                if ~isempty(plugin.Place)
                    fprintf('[LabgridPlugin] Active Place: %s (Carrier: %s)\n', plugin.Place, plugin.Carrier);
                end
            end
        end

        function runTestMethod(plugin, pluginData)
            fprintf('[LabgridPlugin] Running test method: %s\n', pluginData.Name);
            runTestMethod@matlab.unittest.plugins.TestRunnerPlugin(plugin, pluginData);
        end
    end
end
