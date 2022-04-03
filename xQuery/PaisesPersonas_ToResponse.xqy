xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.paisespersonas.org";
(:: import schema at "../xsd/PaisesPersonas.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/dbReferenceAllPaises";
(:: import schema at "../Resources/dbReferenceAllPaises.xsd" ::)
declare namespace ns3="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbReferencePersonasCRUD";
(:: import schema at "../Resources/dbReferencePersonasCRUD_table.xsd" ::)

declare variable $entradaLista as element() (:: schema-element(ns1:Entrada) ::) external;
declare variable $AllPaises as element() (:: schema-element(ns2:dbReferenceAllPaisesOutputCollection) ::) external;
declare variable $AllPersonas as element() (:: schema-element(ns3:PersonasCollection) ::) external;

declare function local:func(
                            $AllPaises as element() (:: schema-element(ns2:dbReferenceAllPaisesOutputCollection) ::), 
                            $AllPersonas as element() (:: schema-element(ns3:PersonasCollection) ::)) 
                            as element() (:: schema-element(ns1:Respuesta) ::) {
    <ns1:Respuesta>
        <ns1:Paises>
            {
                for $dbReferenceAllPaisesOutput in $AllPaises/ns2:dbReferenceAllPaisesOutput
                return 
                <ns1:Pais>
                    <ns1:ID>{fn:data($dbReferenceAllPaisesOutput/ns2:ID_PAIS)}</ns1:ID>
                    <ns1:Descripcion>{fn:data($dbReferenceAllPaisesOutput/ns2:DESCRIPCION)}</ns1:Descripcion>
                    <ns1:Personas>
                        {
                            for $Personas in $AllPersonas/ns3:Personas
                            return 
                            <ns1:Persona>
                                <ns1:DNI>{fn:data($Personas/ns3:dni)}</ns1:DNI>
                                <ns1:Nombre>{fn:data($Personas/ns3:nombre)}</ns1:Nombre>
                                <ns1:Apellido>{fn:data($Personas/ns3:apellido)}</ns1:Apellido>
                                <ns1:Pais>{fn:data($Personas/ns3:pais)}</ns1:Pais></ns1:Persona>
                        }</ns1:Personas></ns1:Pais>
            }
        </ns1:Paises>
    </ns1:Respuesta>
};

local:func($AllPaises, $AllPersonas)
