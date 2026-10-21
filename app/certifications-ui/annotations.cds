using ESMAService as service from '../../srv/service';
annotate service.Certifications with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : Title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Provider',
                Value : Provider,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ValidUntil',
                Value : ValidUntil,
            },
            {
                $Type : 'UI.DataField',
                Label : 'IssuedAt',
                Value : IssuedAt,
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
            Label : 'Title',
            Value : Title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Provider',
            Value : Provider,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ValidUntil',
            Value : ValidUntil,
        },
        {
            $Type : 'UI.DataField',
            Label : 'IssuedAt',
            Value : IssuedAt,
        },
    ],
);

