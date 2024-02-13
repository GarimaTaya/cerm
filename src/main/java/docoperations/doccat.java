/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package docoperations;

/**
 *
 * @author Administrator
 */
public class doccat
 {
    long id;
    String name;
    public long getId()
    {
        return id;
    }
    public void setId(Long id)
    {
        this.id=id;
    }
    public String getname()
    {
        return name;
    }
    public void setname(String name)
    {
        this.name=name;
    }
    public String toString()
    {
        return "category{" + "id="+id +",name='"+name +'\''+ '}';
    }
    
}
