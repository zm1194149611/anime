package com.ming.frame.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Author : WANGYX
 * Date : 2012-11-19
 * Verion : 3.0
 */
public final class FileUtil
{

    /**
     * 构造函数
     */
    private FileUtil()
    {

    }

    /**
     * 定义日志输出器
     */
    private static final Logger log = LoggerFactory.getLogger(FileUtil.class);

    /**
     * 读取文件信息
     * @param path 文件路径
     * @return the value of the file
     */
    public static String readFile(String path)
    {
        if(path.startsWith("file:/"))
        {
            //path = path.replace("file:/", "");
            path = path.substring(5);//LINUX下必须留有/作为绝对根路径
        }
        File file = new File(path);
        return readFile(file);
    }
    
    /**
     * 读取文件信息
     * @param path 文件路径
     * @return the value of the file
     */
    public static String readFile(File file)
    {
        InputStreamReader read = null;
        try
        {
            read = new InputStreamReader(new FileInputStream(file), "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(read);
            StringBuffer sb = new StringBuffer();
            String lineTXT = null;
            while ((lineTXT = bufferedReader.readLine()) != null)
            {
            	//sb.append(lineTXT.toString().trim());
                sb.append(lineTXT.toString()).append(" ");//追加一个空格防止SQL拼接出现两个字符连在一起
            }

            read.close();
            return sb.toString();
        }
        catch (UnsupportedEncodingException e)
        {
            log.error("不支持UTF-8编码格式");
        }
        catch (FileNotFoundException e)
        {
            log.error("不存在文件" + file.getPath());
        }
        catch (IOException e)
        {
            log.error("读取文件" + file.getPath() + "失败！");
        }
        return null;
    }

    /**
     * 读取文件信息
     * @param in InputStream
     * @return the value of the file
     */
    public static String readFile(InputStream in)
    {
        InputStreamReader read = null;
        try
        {
            read = new InputStreamReader(in, "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(read);
            StringBuffer sb = new StringBuffer();
            String lineTXT = null;
            while ((lineTXT = bufferedReader.readLine()) != null)
            {
                sb.append(lineTXT.toString().trim());
            }
            read.close();
            return sb.toString();
        }
        catch (UnsupportedEncodingException e)
        {
            log.error("不支持UTF-8编码格式");
        }
        catch (IOException e)
        {
            log.error("文件读取IO异常");
        }
        return null;
    }

    /**
     * 写出文件
     * @param path 文件路径
     * @param value 文件内容
     */
    public static void writeFile(String path, String value)
    {
        try
        {
            path = path.replace("file:/", "");
            File desFile = new File(path);
            if (!desFile.exists())
            {
                int i = path.lastIndexOf("/");
                if (i == -1)
                {
                    i = path.lastIndexOf("\\");
                }
                File f = new File(path.substring(0, i + 1));
                if (!f.exists())
                {
                    f.mkdirs();
                }
                desFile.createNewFile();
            }
            BufferedWriter output;

            output = new BufferedWriter(new FileWriter(desFile));

            output.write(value);
            output.close();
        }
        catch (IOException e)
        {
            log.error("文件" + path + "写入IO异常");
        }
    }
    
    
    
    
    /**
     * 写出文件
     * @param path 文件路径
     * @param value 文件内容
     */
    public static void writeFile(String path, InputStream is)
    {
        try
        {
            path = path.replace("file:/", "");
            File desFile = new File(path);
            if (!desFile.exists())
            {
                int i = path.lastIndexOf("/");
                if (i == -1)
                {
                    i = path.lastIndexOf("\\");
                }
                File f = new File(path.substring(0, i + 1));
                if (!f.exists())
                {
                    f.mkdirs();
                }
                desFile.createNewFile();
            }
            FileOutputStream foptS = new FileOutputStream(desFile);
            OutputStream optS = (OutputStream) foptS;

            int c;
            while((c=is.read())!=-1)
            {
                optS.write(c);
            }
            optS.flush();
            optS.close();
            foptS.close();
        }
        catch (IOException e)
        {
            log.error("文件" + path + "写入IO异常");
        }
        finally
        {
        	
        }
    }
    
    public static void deleteFile(String path)
    {
            File desFile = new File(path);
            log.info("删除文件："+ path);
            if(desFile.exists()) 
            {
            	desFile.delete();
            }
            else 
            {
            	log.info("待删除文件不存在：" + path);
            }
    }
    
}
