package com.icss.mvc.tool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FaceUtil {
	
	//登记
	public static String faceDetect(String accessToken) {
        // ����url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
        try {
//        	String path="C:/Users/lenovo/Desktop/�沿ʶ��/liqin3.jpg";
        	String path="/Users/huanglianming/Documents/GitHub/SSM-10/WebContent/img/Ai-imgtest.jpg";
        	String img=Base64Util.encode(FileUtil.readFileByBytes(path));
            Map<String, Object> map = new HashMap<>();
            map.put("image", img);
            map.put("image_type", "BASE64");

            String param = GsonUtils.toJson(map);  

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
	
	//对比
	public static String faceMatch(String accessToken, String img1, String img2) {
        // 人脸对比url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        try {
 
        	Map<String, Object> map1 = new HashMap<>();
            map1.put("image", img2);
            map1.put("image_type", "BASE64");
        	Map<String, Object> map2 = new HashMap<>();
            map2.put("image", img1);
            map2.put("image_type", "BASE64");
        	List<Map<String,Object>>  maps=new ArrayList<Map<String,Object>>();
        	maps.add(map1);
        	maps.add(map2);
        	
            String param = GsonUtils.toJson(maps);
        
            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
	
	
}
