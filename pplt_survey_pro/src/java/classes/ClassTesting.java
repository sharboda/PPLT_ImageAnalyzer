
package classes;


public class ClassTesting {
    
    public static void main(String...args){
        
        
        Options dd=new Options();
        dd.setPid("P-1477");
        dd.ViewQOPbyone();
        System.out.println(dd.ViewQOPbyone().get(0).getOptionname());
    
    }
    
}
