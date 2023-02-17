sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/sap/risk/risk/test/integration/FirstJourney',
		'com/sap/risk/risk/test/integration/pages/RisksList',
		'com/sap/risk/risk/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, RisksList, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/sap/risk/risk') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRisksList: RisksList,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);