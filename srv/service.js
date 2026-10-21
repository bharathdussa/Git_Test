const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

    const {
        Employees,
        Skills,
        EmployeeSkills,
        Projects,
        EmployeeProjects,
        Certifications,
        EmployeeCertifications
    } = this.entities;


    // =========================================================
    // ASSIGN SKILL TO EMPLOYEE
    // =========================================================

    this.on('AssignSkill', async (req) => {

        const {
            employeeID,
            skillID2,
            proficiencyLevel
        } = req.data;


        // 1. Validate input

        if (!employeeID || !skillID) {
            return req.reject(
                400,
                'employeeID and skillID are required.'
            );
        }


        // 2. Validate proficiency

        if (
            proficiencyLevel === null ||
            proficiencyLevel === undefined ||
            proficiencyLevel < 1 ||
            proficiencyLevel > 5
        ) {
            return req.reject(
                400,
                'Proficiency level must be between 1 and 5.'
            );
        }


        // 3. Check employee

        const employee = await SELECT.one
            .from(Employees)
            .where({
                EmployeeID: employeeID
            });

        if (!employee) {
            return req.reject(
                404,
                'Employee not found.'
            );
        }


        // 4. Check skill

        const skill = await SELECT.one
            .from(Skills)
            .where({
                SkillID: skillID
            });

        if (!skill) {
            return req.reject(
                404,
                'Skill not found.'
            );
        }


        // 5. Check duplicate assignment

        const existing = await SELECT.one
            .from(EmployeeSkills)
            .where({
                employee_EmployeeID: employeeID,
                skill_SkillID: skillID
            });

        if (existing) {
            return req.reject(
                409,
                'This skill is already assigned to the employee.'
            );
        }


        // 6. Create EmployeeSkills relationship

        await INSERT.into(EmployeeSkills).entries({

            ID: cds.utils.uuid(),

            employee_EmployeeID: employeeID,

            skill_SkillID: skillID,

            ProficiencyLevel: proficiencyLevel
        });


        // 7. Return success

        return `Skill '${skill.Name}' successfully assigned to employee '${employee.Name}'.`;

    });



    // =========================================================
    // ASSIGN EMPLOYEE TO PROJECT
    // =========================================================

    this.on('AssignEmployeeToProject', async (req) => {

        const {
            employeeID,
            projectID
        } = req.data;


        // 1. Validate input

        if (!employeeID || !projectID) {
            return req.reject(
                400,
                'employeeID and projectID are required.'
            );
        }


        // 2. Check employee

        const employee = await SELECT.one
            .from(Employees)
            .where({
                EmployeeID: employeeID
            });

        if (!employee) {
            return req.reject(
                404,
                'Employee not found.'
            );
        }


        // 3. Check project

        const project = await SELECT.one
            .from(Projects)
            .where({
                ProjectID: projectID
            });

        if (!project) {
            return req.reject(
                404,
                'Project not found.'
            );
        }


        // 4. Validate project dates

        if (
            project.StartDate &&
            project.EndDate &&
            project.StartDate > project.EndDate
        ) {
            return req.reject(
                400,
                'Project EndDate cannot be earlier than StartDate.'
            );
        }


        // 5. Check duplicate project assignment

        const existing = await SELECT.one
            .from(EmployeeProjects)
            .where({
                employee_EmployeeID: employeeID,
                project_ProjectID: projectID
            });

        if (existing) {
            return req.reject(
                409,
                'Employee is already assigned to this project.'
            );
        }


        // 6. Create EmployeeProjects relationship

        await INSERT.into(EmployeeProjects).entries({

            ID: cds.utils.uuid(),

            employee_EmployeeID: employeeID,

            project_ProjectID: projectID
        });


        // 7. Return success

        return `Employee '${employee.Name}' successfully assigned to project '${project.Name}'.`;

    });



    // =========================================================
    // ADD CERTIFICATION TO EMPLOYEE
    // =========================================================

    this.on('AddCertification', async (req) => {

        const {
            employeeID,
            certificationID
        } = req.data;


        // 1. Validate input

        if (!employeeID || !certificationID) {
            return req.reject(
                400,
                'employeeID and certificationID are required.'
            );
        }


        // 2. Check employee

        const employee = await SELECT.one
            .from(Employees)
            .where({
                EmployeeID: employeeID
            });

        if (!employee) {
            return req.reject(
                404,
                'Employee not found.'
            );
        }


        // 3. Check certification

        const certification = await SELECT.one
            .from(Certifications)
            .where({
                CertID: certificationID
            });

        if (!certification) {
            return req.reject(
                404,
                'Certification not found.'
            );
        }


        // 4. Validate certification dates

        if (
            certification.IssuedAt &&
            certification.ValidUntil &&
            certification.IssuedAt > certification.ValidUntil
        ) {
            return req.reject(
                400,
                'Certification ValidUntil cannot be earlier than IssuedAt.'
            );
        }


        // 5. Check duplicate certification

        const existing = await SELECT.one
            .from(EmployeeCertifications)
            .where({
                employee_EmployeeID: employeeID,
                certification_CertID: certificationID
            });

        if (existing) {
            return req.reject(
                409,
                'This certification is already assigned to the employee.'
            );
        }


        // 6. Create EmployeeCertifications relationship

        await INSERT.into(EmployeeCertifications).entries({

            ID: cds.utils.uuid(),

            employee_EmployeeID: employeeID,

            certification_CertID: certificationID
        });


        // 7. Return success

        return `Certification '${certification.Title}' successfully added to employee '${employee.Name}'.`;

    });

});