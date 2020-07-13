package com.icss.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.adminDao;
import com.icss.mvc.tool.Base64Util;
import com.icss.mvc.tool.ClientToken;
import com.icss.mvc.tool.FaceUtil;

import net.sf.json.JSON;




@Controller
public class AiController {
	@Autowired
	private adminDao dao;
	
	//��ȡǩ��
//    private String token="24.dd1e24840283658a12e0810e2fc9c1c3.2592000.1596678949.282335-21168213";
    private String token="24.c9205385fd287ed48527a88125f88399.2592000.1597207232.282335-21287252";
	@RequestMapping("showToken")
	@ResponseBody
	public String fun1() {
		System.out.println("showToken----------");
//		String ak="zWgAujs7LAGvHSIH0uVcPyOe";
//		String sk="p6asqvcgwNvGp5N0zlyxwKxmI8hDnbc6";
		String ak="zqWA7Xr7ONoqRVnfeVROP3f0";
		String sk="TOdZLjLVyqRKu056GR1GzelY6KG5PRwL";
		String token=ClientToken.getAuth(ak, sk);
		return token;
	}
	//�������
	@RequestMapping("showDetect")
	@ResponseBody
	public String fun2() {
		System.out.println("showDetect----------");
		String result=FaceUtil.faceDetect(token);
		return result;
	}
	//�����Ա�
		@RequestMapping("showMatch")
		@ResponseBody
		public String fun3() {
			System.out.println("----------");
			String result=FaceUtil.faceMatch(token);
			return result;
		}
		
////	图片上传
//	@RequestMapping("upimg")
//	@ResponseBody
//	public String fun8(String data,byte[] base64) throws Exception {
//		System.out.println("upimg----------------------------"+base64);
//
//		return "";
//	}
	
		
	@RequestMapping("getPicture")
    @ResponseBody
    public double func4(@RequestParam(value="imgData")String imgData){
        String img1 = imgData.substring(22);
        System.out.println("upimg----------------------------"+img1);
        List<byte[]> faces = dao.findImg();
        System.out.println(faces);
        for (int i = 0; i < faces.size(); i++) {
            String img2 = Base64Util.encode(faces.get(i));
            String result = FaceUtil.faceMatch(token, img1, img2);
            JSONObject jsonObject = JSON.parseObject(result);
            double score = Double.parseDouble(jsonObject.getJSONObject("result").getString("score"));
            if (score > 85){
                return score;
            }
        }
        return null;
    }	
}
