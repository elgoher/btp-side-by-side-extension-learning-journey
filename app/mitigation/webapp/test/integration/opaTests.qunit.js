sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'mitigation/mitigation/test/integration/FirstJourney',
		'mitigation/mitigation/test/integration/pages/MitigationsList',
		'mitigation/mitigation/test/integration/pages/MitigationsObjectPage',
		'mitigation/mitigation/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, MitigationsList, MitigationsObjectPage, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('mitigation/mitigation') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMitigationsList: MitigationsList,
					onTheMitigationsObjectPage: MitigationsObjectPage,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);