xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.paises.org";
(:: import schema at "../xsd/Paises.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/dbReferenceAllPaises";
(:: import schema at "../Resources/dbReferenceAllPaises.xsd" ::)

declare variable $entrada as element() (:: schema-element(ns1:dbReferenceAllPaisesOutputCollection) ::) external;

declare function local:func($entrada as element() (:: schema-element(ns1:dbReferenceAllPaisesOutputCollection) ::)) as element() (:: schema-element(ns2:Paises) ::) {
    <ns2:Paises>
        {
            for $dbReferenceAllPaisesOutput in $entrada/ns1:dbReferenceAllPaisesOutput
            return 
            <ns2:Pais>
                <ns2:ID>{fn:data($dbReferenceAllPaisesOutput/ns1:ID_PAIS)}</ns2:ID>
                <ns2:Descripcion>{fn:data($dbReferenceAllPaisesOutput/ns1:DESCRIPCION)}</ns2:Descripcion>
            </ns2:Pais>
        }
    </ns2:Paises>
};

local:func($entrada)
