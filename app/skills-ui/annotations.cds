using ESMAService as service from '../../srv/service';
annotate service.Skills with @(
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
                Label : 'Category',
                Value : Category,
            },
            {
                $Type : 'UI.DataField',
                Value : employees.skill.Category,
                Label : 'Category',
            },
            {
                $Type : 'UI.DataField',
                Value : employees.skill.Name,
                Label : 'Name',
            },
            {
                $Type : 'UI.DataField',
                Value : employees.skill.SkillID,
                Label : 'SkillID',
            },
            {
                $Type : 'UI.DataField',
                Value : employees.skill.employees.employee_EmployeeID,
                Label : 'employee_EmployeeID',
            },
            {
                $Type : 'UI.DataField',
                Value : employees.skill.employees.ProficiencyLevel,
                Label : 'ProficiencyLevel',
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Category',
            Value : Category,
        },
    ],
);

