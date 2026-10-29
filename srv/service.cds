using { Employee.Management as db } from '../db/schema';

@path: '/odata/v4/esma'
service ESMAService {
    /** this is dev  this is qa*/
    entity Employees as projection on db.Employees;
    entity Skills as projection on db.Skills;
    entity EmployeeSkills as projection on db.EmployeeSkills;

    entity Projects as projection on db.Projects;
    entity EmployeeProjects as projection on db.EmployeeProjects;

    entity Certifications as projection on db.Certifications;
    entity EmployeeCertifications as projection on db.EmployeeCertifications;


    action AssignSkill(
        employeeID : UUID,
        skillID : UUID,
        proficiencyLevel : Integer
    ) returns String;

    action AssignEmployeeToProject(
        employeeID : UUID,
        projectID : UUID
    ) returns String;

    action AddCertification(
        employeeID : UUID,
        certificationID : UUID
    ) returns String;
}