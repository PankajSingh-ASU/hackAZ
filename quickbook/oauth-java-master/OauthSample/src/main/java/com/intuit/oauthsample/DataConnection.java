package com.intuit.oauthsample;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.intuit.ipp.core.Context;
import com.intuit.ipp.core.ServiceType;
import com.intuit.ipp.data.Customer;
import com.intuit.ipp.data.Vendor;
import com.intuit.ipp.security.OAuthAuthorizer;
import com.intuit.ipp.services.DataService;
import com.intuit.ipp.util.Config;

public class DataConnection {
	String companyID="123145702785832";
	String appToken="6af5c67bbb1c6b4691bba2fbfeece04a61f1";
	String consumerKey="qyprdLTJZOLCiXlfJKkobpPe1Q0C5E";
	String consumerSecret="b8iRf6lWg4MebnG2BTvOcncNUjE5cMY94HZad8ys";
	String latKey="lat";
	String longKey="long";


	public void getAllCustomers( String accessToken, String accessTokenSecret)
	{
		Config.setProperty(Config.BASE_URL_QBO, "https://sandbox-quickbooks.api.intuit.com/v3/company");
		OAuthAuthorizer oauth = new OAuthAuthorizer(consumerKey, consumerSecret, "qyprdmmFSSYeYjq3TrS3jkqgIpUg69lLWb4yS3p6ZnBGQJwD", "TfsQX3RqepiY1XIZdgS4TdsOfeSfu5AzzsObXhbP"); 
		Customer customer=new Customer();
		List<Customer> customers= new ArrayList<Customer>();

		try {
			Context context = new Context(oauth, appToken, ServiceType.QBO, companyID);
			DataService service = new DataService(context);
			customers = service.findAll(new Customer());
			JsonArray latLongArray=new JsonArray();
			for(Customer cust:customers)
			{
				
				if(cust.getShipAddr()!=null)
				{
					JsonObject custObj=new JsonObject();
					if(!"INVALID".equalsIgnoreCase(cust.getShipAddr().getLat())){
						custObj.addProperty(latKey, cust.getShipAddr().getLat());
						System.out.println(cust.getShipAddr().getLat());
					}
					if(!"INVALID".equalsIgnoreCase(cust.getShipAddr().getLong())){
						System.out.println(cust.getShipAddr().getLong());
						custObj.addProperty(longKey, cust.getShipAddr().getLong());
					}
					
						System.out.println(cust.getShipAddr().getLong());
						custObj.addProperty("Name", cust.getGivenName()+ " "+cust.getFamilyName());
					
					latLongArray.add(custObj);
				}
			}
			System.out.println(latLongArray.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return customers;
	}

	

	public static void main(String[] args) {
		DataConnection dataConnection=new DataConnection();
		dataConnection.getAllCustomers("", "");
	}
}
