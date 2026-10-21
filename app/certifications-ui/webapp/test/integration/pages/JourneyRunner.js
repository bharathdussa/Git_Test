sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"certificationsui/test/integration/pages/CertificationsList.gen",
	"certificationsui/test/integration/pages/CertificationsObjectPage.gen"
], function (JourneyRunner, CertificationsListGenerated, CertificationsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('certificationsui') + '/test/flp.html#app-preview',
        pages: {
			onTheCertificationsListGenerated: CertificationsListGenerated,
			onTheCertificationsObjectPageGenerated: CertificationsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

