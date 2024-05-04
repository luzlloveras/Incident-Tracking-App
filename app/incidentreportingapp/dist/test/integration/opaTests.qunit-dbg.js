sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'incidentreportingapp/test/integration/FirstJourney',
		'incidentreportingapp/test/integration/pages/IncidentsList',
		'incidentreportingapp/test/integration/pages/IncidentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, IncidentsList, IncidentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('incidentreportingapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheIncidentsList: IncidentsList,
					onTheIncidentsObjectPage: IncidentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);