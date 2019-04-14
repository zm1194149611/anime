package com.ming.frame.utils;

import java.io.File;

public class ReadChannelFile 
{
	
	public static void main(String[] args) 
	{
		String srcPath = "E:\\apktest\\source\\demo2-debug\\META-INF";
		File signFile = new File(srcPath);
		if(signFile.exists())
		{
			File sonFiles[] = signFile.listFiles();
			if(sonFiles != null && sonFiles.length > 0)
			{
				//循环签名目录下的文件，获取channle_xxx文件的渠道号xxx
				for(File f : sonFiles)
				{
					if(f.getName().startsWith("channel"))
					{
						System.out.println("channelCode=" + f.getName().split("_")[1]);
						break;
					}
				}
			}
		}
	}

}
