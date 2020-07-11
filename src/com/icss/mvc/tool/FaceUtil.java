package com.icss.mvc.tool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FaceUtil {
	
	//人脸检测
	public static String faceDetect(String accessToken) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
        try {
        	String path="C:/Users/lenovo/Desktop/面部识别/liqin3.jpg";
        	String img=Base64Util.encode(FileUtil.readFileByBytes(path));
            Map<String, Object> map = new HashMap<>();
            map.put("image", img);
            map.put("face_field", "age,face_type,beauty,type");
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
	
	//人脸对比
	public static String faceMatch(String accessToken) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        try {
        	String path="C:/Users/lenovo/Desktop/面部识别/liqin1.jpeg";
        	String img=Base64Util.encode(FileUtil.readFileByBytes(path));
            
        	Map<String, Object> map1 = new HashMap<>();
            map1.put("image", "a5a56145a5e5ccd95af4fc8803d233f3");
            map1.put("image_type", "FACE_TOKEN");
        	Map<String, Object> map2 = new HashMap<>();
            map2.put("image", img);
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
