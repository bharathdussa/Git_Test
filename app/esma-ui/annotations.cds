using ESMAService as service from '../../srv/service';
annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Department',
                Value : Department,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : Role,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : Email,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Skills',
            ID : 'Skills',
            Target : 'skills/@UI.LineItem#Skills',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Certifications',
            ID : 'Certifications',
            Target : 'certifications/@UI.LineItem#Certifications',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Projects',
            ID : 'Projects',
            Target : 'projects/@UI.LineItem#Projects',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Department',
            Value : Department,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Role',
            Value : Role,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : Email,
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ESMAService.EntityContainer/AssignSkill',
            Label : 'AssignSkill',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ESMAService.EntityContainer/AssignEmployeeToProject',
            Label : 'AssignEmployeeToProject',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ESMAService.EntityContainer/AddCertification',
            Label : 'AddCertification',
        },
    ],
);

annotate service.EmployeeSkills with @(
    UI.LineItem #Skills : [
        {
            $Type : 'UI.DataField',
            Value : skill.Category,
            Label : 'Category',
        },
        {
            $Type : 'UI.DataField',
            Value : skill.Name,
            Label : 'Name',
        },
        {
            $Type : 'UI.DataField',
            Value : skill.SkillID,
            Label : 'SkillID',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ESMAService.EntityContainer/AssignSkill',
            Label : 'AssignSkill',
        },
    ]
);

annotate service.EmployeeCertifications with @(
    UI.LineItem #Certifications : [
        {
            $Type : 'UI.DataField',
            Value : certification.CertID,
            Label : 'CertID',
        },
        {
            $Type : 'UI.DataField',
            Value : certification.IssuedAt,
            Label : 'IssuedAt',
        },
        {
            $Type : 'UI.DataField',
            Value : certification.Provider,
            Label : 'Provider',
        },
        {
            $Type : 'UI.DataField',
            Value : certification.Title,
            Label : 'Title',
        },
        {
            $Type : 'UI.DataField',
            Value : certification.ValidUntil,
            Label : 'ValidUntil',
        },
    ]
);

annotate service.EmployeeProjects with @(
    UI.LineItem #Projects : [
        {
            $Type : 'UI.DataField',
            Value : project.Description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : project.EndDate,
            Label : 'EndDate',
        },
        {
            $Type : 'UI.DataField',
            Value : project.Name,
            Label : 'Name',
        },
        {
            $Type : 'UI.DataField',
            Value : project.ProjectID,
            Label : 'ProjectID',
        },
        {
            $Type : 'UI.DataField',
            Value : project.StartDate,
            Label : 'StartDate',
        },
    ]
);

