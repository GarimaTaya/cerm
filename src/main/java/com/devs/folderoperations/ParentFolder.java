/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.devs.folderoperations;

import java.io.File;
import java.util.Random;

/**
 *
 * @author Administrator
 */
public class ParentFolder
{
    public String CreateParentFolder(String foldername)
    { 
        Random random = new Random(); 
        foldername = foldername + random.nextLong();  
        //Instantiate the File class   
        File f1 = new File("uploads/".concat(foldername));
        //Creating a folder using mkdir() method  
        boolean bool = f1.mkdir();  
        if(bool){  
           System.out.print("Folder is created successfully in ");  
           System.out.println(System.getProperty("user.dir"));
        }else{  
           System.out.println("Error Found in creating folder!");  
        } 
        return(foldername);
    }

    
}
