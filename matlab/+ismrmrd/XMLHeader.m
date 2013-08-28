classdef XMLHeader

    methods

        function obj = XMLHeader(xmlstr)

            obj.factory = org.ismrm.ismrmrd.ObjectFactory();
        end

        function hdr = fromString(obj,xmlstring)
            import javax.xml.bind.*
            jc = JAXBContext.newInstance('org.ismrm.ismrmrd', obj.factory.getClass().getClassLoader());
            u  = jc.createUnmarshaller();
            jstr = java.lang.String(xmlstring);
            hdr = u.unmarshal(java.io.ByteArrayInputStream(jstr.getBytes()));

        end

        function xmlstring = toString(obj)
            import javax.xml.bind.*
            jc = JAXBContext.newInstance('org.ismrm.ismrmrd', obj.factory.getClass().getClassLoader());
            m  = jc.createMarshaller();
            m.setProperty(Marshaller.JAXB_SCHEMA_LOCATION, 'http://www.ismrm.org/ISMRMD ismrmrd.xsd');

            strbuff = java.io.StringWriter();
            m.marshal(hdr, strbuff);
            xmlstring = strbuff.toString();

        end

    end

end
