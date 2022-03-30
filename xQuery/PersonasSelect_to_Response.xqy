xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.personas.org";
(:: import schema at "../xsd/Personas.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbReferencePersonasCRUD";
(:: import schema at "../Resources/dbReferencePersonasCRUD_table.xsd" ::)

declare variable $entrada as element() (:: schema-element(ns1:PersonasCollection) ::) external;

declare function local:func($entrada as element() (:: schema-element(ns1:PersonasCollection) ::)) as element() (:: schema-element(ns2:Personas) ::) {
    <ns2:Personas>
        {
            for $Personas in $entrada/ns1:Personas
            return 
            <ns2:Persona>
                <ns2:Pais>{fn:data($Personas/ns1:pais)}</ns2:Pais>
                <ns2:Apellido>{fn:data($Personas/ns1:apellido)}</ns2:Apellido>
                <ns2:Nombre>{fn:data($Personas/ns1:nombre)}</ns2:Nombre>
                <ns2:DNI>{fn:data($Personas/ns1:dni)}</ns2:DNI></ns2:Persona>
        }
    </ns2:Personas>
};

local:func($entrada)
