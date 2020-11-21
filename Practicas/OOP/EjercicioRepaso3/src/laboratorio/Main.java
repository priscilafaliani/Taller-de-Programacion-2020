package laboratorio;

import java.util.Scanner;

public class Main {

    static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        GrupoBeta grupoBeta = new GrupoBeta();
        GrupoAlfa grupoAlfa = new GrupoAlfa();

        System.out.println("Plantas del grupo Beta: ");
        for (int i = 0; i < 3; i++) {
            grupoBeta.agregarPlanta(leerPlanta());
        }

        System.out.println("Plantas del grupo Alfa: ");
        for (int i = 0; i < 4; i++) {
            grupoAlfa.agregarPlanta(leerPlanta());
        }

        /* Se le va a agregar la dosis a todas, aunque sean del grupo beta. Ya que
        * asumo que todas las plantas tienen 0 de dosis :) */
        System.out.println("Dosis para las plantas del grupo Alfa: ");
        grupoAlfa.aplicarDosis(leerDosis());
        System.out.println("Dosis para las plantas del grupo Beta: ");
        grupoBeta.aplicarDosis(leerDosis());

        System.out.println("Representación del grupo Beta: ");
        System.out.println(grupoBeta.toString());

        System.out.println("Representación del grupo Alfa: ");
        System.out.println(grupoAlfa.toString());

    }

    public static Planta leerPlanta() {
        System.out.println("ID: ");
        int ID = scanner.nextInt();
        System.out.println("Nombre: ");
        return new Planta(scanner.next(), ID);
    }

    public static double leerDosis() {
        return scanner.nextDouble();
    }

}
