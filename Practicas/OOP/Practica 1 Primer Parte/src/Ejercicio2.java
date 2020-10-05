/* public class Ejercicio2 {

    public static void main(String[] args) {
        int n = 1;
        for(int i = n; i <= 9; i++){
            System.out.print("Factorial de " + i + ": ");
            n = n * i;
            System.out.println(n);   
        }
    }
    
} /*

/* MODIFICACIÃ“N PARA QUE SOLO IMPRIMA FACTORIALES IMPARES */

public class Ejercicio2 {

    public static void main(String[] args) {
        int n = 1;
        for(int i = n; i <= 9; i++){
            n = n * i;
            if(i % 2 == 1){
                System.out.print("Factorial de " + i + ": ");
                System.out.println(n);
            }               
        }
    }
    
}