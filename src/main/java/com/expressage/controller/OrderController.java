package com.expressage.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.expressage.entity.Expressage;
import com.expressage.entity.Orders;
import com.expressage.entity.Users;
import com.expressage.service.ExpressageService;
import com.expressage.service.OrdersService;
import com.expressage.util.AlipayConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/")
public class OrderController {

    @Autowired(required = false)
    private ExpressageService expressageService;
    @Autowired(required = false)
    private OrdersService ordersService;

    @RequestMapping("/alipay")
    @ResponseBody
    public void GoPay(HttpServletRequest request, HttpServletResponse response){
        String expressage_id = request.getParameter("expressage_id");
        Expressage expressage = expressageService.getOneExpressageInfo(Integer.parseInt(expressage_id));

        //获取初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,AlipayConfig.app_id,AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号
        Date date = new Date();
        String out_trade_no = Long.toString(date.getTime());

        //付款金额，必填
        String total_amount = String.valueOf(0.01);

        //订单名称，必填
        String subject = "收货人："+expressage.getExpressage_recipient_name()+" 取货码："+expressage.getExpressage_code();

        //商品描述，可空
        String body = "";

        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "1c";

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\""+ timeout_express +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        try{
            String result = alipayClient.pageExecute(alipayRequest).getBody();
            Orders orders = new Orders();
            orders.setExpressage_id(Integer.parseInt(expressage_id));
            orders.setOrder_no(out_trade_no);
            orders.setOrder_title(subject);
            orders.setOrder_amount(total_amount);
            orders.setOrder_status(0);
            int flag = ordersService.addOrders(orders);

            if (flag > 0){
                response.setContentType("text/html;charset=" + AlipayConfig.charset);
                response.getWriter().write(result);//直接将完整的表单html输出到页面
                response.getWriter().flush();
                response.getWriter().close();
            }
        }catch (Exception e){
            System.out.println("订单请求错误");
        }

    }

    @GetMapping("/return_url")
    public String return_url(HttpServletRequest request) throws Exception{
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();

        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";

            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            System.out.println("同步验签---- " + valueStr);
            params.put(name, valueStr);
        }

        try {
            boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
            Orders orders = new Orders();
            if(signVerified) {
                //商户订单号
                String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

                //支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

                //付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

                orders = ordersService.getOrder(out_trade_no);
                Users users = (Users)request.getSession().getAttribute("user");
                int flag_expressage = expressageService.updateExpressageInfo(orders.getExpressage_id(),3,"",users);
                int flag_expressagestatus = expressageService.updateExpressageStatus(orders.getExpressage_id(),3);
                if (flag_expressage > 0 && flag_expressagestatus > 0){
                    return "/expressage/success";
                }
                return "/expressage/fail";
            }else {
                System.out.println("验签失败");
                return "/expressage/fail";
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("验证错误");
            return "/expressage/fail";
        }
    }

    @GetMapping("/notify_url")
    public String notify_url(HttpServletRequest request) throws Exception{
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();

        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";

            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            System.out.println("同步验签---- " + valueStr);
            params.put(name, valueStr);
        }

        try {
            boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
            Orders orders = new Orders();
            if(signVerified) {
                //商户订单号
                String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

                //支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

                //付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

                orders = ordersService.getOrder(out_trade_no);
                Users users = (Users)request.getSession().getAttribute("user");
                int flag = expressageService.updateExpressageInfo(orders.getExpressage_id(),3,"",users);
                int flag_expressagestatus = expressageService.updateExpressageStatus(orders.getExpressage_id(),3);
                if (flag > 0 && flag_expressagestatus > 0){
                    return "/expressage/success";
                }
                return "/expressage/fail";
            }else {
                System.out.println("验签失败");
                return "/expressage/fail";
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("验证错误");
            return "/expressage/fail";
        }
    }
}
