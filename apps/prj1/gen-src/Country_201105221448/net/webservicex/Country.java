
package net.webservicex;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.3-b02-
 * Generated source version: 2.1
 * 
 */
@WebServiceClient(name = "country", targetNamespace = "http://www.webserviceX.NET", wsdlLocation = "http://www.webservicex.net/country.asmx?WSDL")
public class Country
    extends Service
{

    private final static URL COUNTRY_WSDL_LOCATION;
    private final static Logger logger = Logger.getLogger(net.webservicex.Country.class.getName());

    static {
        URL url = null;
        try {
            URL baseUrl;
            baseUrl = net.webservicex.Country.class.getResource(".");
            url = new URL(baseUrl, "http://www.webservicex.net/country.asmx?WSDL");
        } catch (MalformedURLException e) {
            logger.warning("Failed to create URL for the wsdl Location: 'http://www.webservicex.net/country.asmx?WSDL', retrying as a local file");
            logger.warning(e.getMessage());
        }
        COUNTRY_WSDL_LOCATION = url;
    }

    public Country(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public Country() {
        super(COUNTRY_WSDL_LOCATION, new QName("http://www.webserviceX.NET", "country"));
    }

    /**
     * 
     * @return
     *     returns CountrySoap
     */
    @WebEndpoint(name = "countrySoap")
    public CountrySoap getCountrySoap() {
        return super.getPort(new QName("http://www.webserviceX.NET", "countrySoap"), CountrySoap.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns CountrySoap
     */
    @WebEndpoint(name = "countrySoap")
    public CountrySoap getCountrySoap(WebServiceFeature... features) {
        return super.getPort(new QName("http://www.webserviceX.NET", "countrySoap"), CountrySoap.class, features);
    }

}
