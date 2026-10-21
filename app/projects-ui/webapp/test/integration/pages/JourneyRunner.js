sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"projectsui/test/integration/pages/ProjectsList.gen",
	"projectsui/test/integration/pages/ProjectsObjectPage.gen"
], function (JourneyRunner, ProjectsListGenerated, ProjectsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('projectsui') + '/test/flp.html#app-preview',
        pages: {
			onTheProjectsListGenerated: ProjectsListGenerated,
			onTheProjectsObjectPageGenerated: ProjectsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

