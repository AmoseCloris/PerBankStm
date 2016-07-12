个人网银对外转账
1、新建一个web project
2、拷贝相应jar包
3、调整前端页面

//关于随机客户号

//定义一个公共类在Util中
public class Utilcomm{

public static String getCusId()
{
	long currtime=System.currentTimeMillis();
	String strtime=String.valueOf(currtime);
	
 	return sretime.substring(strtime.length()-11);
}

}