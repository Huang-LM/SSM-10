package com.icss.mvc.tool;

import java.util.HashMap;
import java.util.Map;
//人脸检测..
public class FaceUtil {

	public static String faceDetect(String accessToken) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
        try {
        	String path="C:/Users/lenovo/Desktop/面部识别/jyx1.jpg";
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
}
