sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"skillsui/test/integration/pages/SkillsList.gen",
	"skillsui/test/integration/pages/SkillsObjectPage.gen"
], function (JourneyRunner, SkillsListGenerated, SkillsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('skillsui') + '/test/flp.html#app-preview',
        pages: {
			onTheSkillsListGenerated: SkillsListGenerated,
			onTheSkillsObjectPageGenerated: SkillsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

