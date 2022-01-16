package com.camping.controller.model.joonggo.dto;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

public class kakao {
	private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/address.json?query="; 
	private static String GEOCODE_USER_INFO="KakaoAK 3a26b6b2e9469670e32afc46ff03d7c6";
	private String address;
	private URL obj;
	
	public void setAddress(String address) {
		try {
			this.address = URLEncoder.encode(address,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	public Map<String,Double> getResult() {
		Map<String,Double> res = new HashMap<String,Double>();
		StringBuffer response = new StringBuffer();
		
		try {
			obj = new URL(GEOCODE_URL + address);
			HttpURLConnection con = null;
			
			try {
				con = (HttpURLConnection)obj.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization",GEOCODE_USER_INFO); 
				con.setRequestProperty("content-type", "application/json"); 
				con.setDoOutput(true); 
				con.setUseCaches(false); 
				con.setDefaultUseCaches(false);
				
				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				String inputLine;
				
				while((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			} 
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		Gson gson = new Gson();
		Map map = gson.fromJson(response.toString(), Map.class);
		ArrayList list = (ArrayList) map.get("documents");
		Map map2 = (Map) list.get(0);
		Map map3 = (Map) (map2.get("address"));
		res.put("latitude", Double.parseDouble((String) map3.get("y")));
		res.put("longitude", Double.parseDouble((String) map3.get("x")));
		
		return res;
	}
	
	public static void main(String[] args) {
		/*
		 * kakao k = new kakao(); k.setAddress("송파대로 567");
		 * 
		 * Map map = k.getResult(); System.out.println(map.get("latitude"));
		 * System.out.println(map.get("longitude"));
		 */
		
		Date date = new Date("1642263648000");
		System.out.println(date);
	}
}






















