namespace Employee.Management;

entity Employees {

    key EmployeeID : UUID;

    Name       : String(100) @mandatory;
    Department : String(50);
    Role       : String(30);
    Email      : String(100);

    skills : Composition of many EmployeeSkills
        on skills.employee = $self;

    projects : Composition of many EmployeeProjects
        on projects.employee = $self;

    certifications : Composition of many EmployeeCertifications
        on certifications.employee = $self;
}


entity Skills {

    key SkillID : UUID;

    Name     : String(100) @mandatory;
    Category : String(50);

    employees : Association to many EmployeeSkills
        on employees.skill = $self;
}


entity EmployeeSkills {

    key ID : UUID;

    employee : Association to Employees;
    skill    : Association to Skills;

    ProficiencyLevel : Integer;
}


entity Projects {

    key ProjectID : UUID;

    Name        : String(100) @mandatory;
    Description : String(1000);
    StartDate   : Date;
    EndDate     : Date;

    employees : Association to many EmployeeProjects
        on employees.project = $self;
}


entity EmployeeProjects {

    key ID : UUID;

    employee : Association to Employees;
    project  : Association to Projects;
}


entity Certifications {

    key CertID : UUID;

    Title      : String(200) @mandatory;
    Provider   : String(100);
    ValidUntil : Date;
    IssuedAt   : Date;

    employees : Association to many EmployeeCertifications
        on employees.certification = $self;
}


entity EmployeeCertifications {

    key ID : UUID;

    employee      : Association to Employees;
    certification : Association to Certifications;
}