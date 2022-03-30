# OracleServiceBusTP
Trabajo Practico Final de la Capacitación Intensiva sobre Oracle Service Bus de AYI ACADEMY


CREAR TABLAS 

PERSONAS
------------------
pk DNI

Nombre

Apellido

Pais Fk

PAISES
--------------------
id_Pais Pk

Descripcion



Crear ABM para Personas con TopLink, NO EXPONER PROXY, SOLO ADAPTER. 
Crear ABM para Paises con SQL puro, NO EXPONER PROXY, SOLO ADAPTER.


UTILIZAR LAS OPERACIONES ANTERIORES QUE TRAEN TODAS LAS PERSONAS Y TODOS LOS PAISES.

Crear un servicio propio (WSDL y XSD) con UNA SOLA OPERACION QUE RECIBA UNA LISTA DE PAISES.
ORQUESTAR dentro del ROUTE para llamar a la operacion que devuelve TODOS LOS PAISES.
DENTRO DEL RESPONSE HACER UN FOREACH POR CADA PAIS CON UN IF QUE CONTROLE SI EL PAIS ESTA EN LA LISTA DE ENTRADA 
Y HACER UN SERVICE CALLOUT QUE LLAME A OBTENER TODAS LAS PERSONAS.
CON UNA XQUERY UNIR Y ENRIQUECER LA RESPUESTA DEVOLVIENDO LA LISTA DE PAISES CON SUS RESPECTIVOS HABITANTES.


Exponerlo como REST

Fecha de entrega Martes 5 - 12 HS.
ENTREGAR ARCHIVO ZIP o JAR en WHATSAPP.  (obligatorio)
Y CÓDIGO VERSIONADO EN GITHUB o LAB (opcional con puntos)
Se debe acompañar de proyecto en SOAPUI y en POSTMAN. (opcional con puntos)
Y los scripts de creación de tablas y carga de datos. (obligatorio)
