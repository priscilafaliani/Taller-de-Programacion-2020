package hospital;

import java.util.Random;
import java.util.Scanner;

public class Main {

    public static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        Random camas = new Random();

        Hospital hospital = new Hospital("La Ribera", "Avenida Siempre Viva 742");

        for (int i = 0; i < 3; i++) {
            hospital.ingresarPaciente(leerPaciente(), camas.nextInt(100));
        }

        hospital.incrementarDias();

        System.out.println("Cantidad de internados en el hospital: " + hospital.totalInternados());

        hospital.darDeAlta(pacienteADarDeAlta());

    }

    public static int pacienteADarDeAlta() {
        System.out.println("Dni del paciente a dar de alta: ");
        return scanner.nextInt();
    }

    public static Paciente leerPaciente() {
        System.out.println("Nombre del paciente: ");
        String nombre = scanner.nextLine();
        System.out.println("Obra social del paciente: ");
        String obraSocial = scanner.nextLine();
        System.out.println("Dni del paciente: ");
        int dni = scanner.nextInt();
        scanner.nextLine();
        return new Paciente(dni, nombre, obraSocial);
    }

}
