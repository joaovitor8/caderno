import java.util.Scanner;


public class App {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        
        System.out.println("Digite o seu CPF: ");
        String cpf = teclado.nextLine();
        
        if (validarCPF(cpf)) {
            System.out.println("CPF válido!");
        } else {
            System.out.println("CPF inválido!");
        }
        
        teclado.close();
    }
    
    public static boolean validarCPF(String cpf) {
        // Remove pontos e traços
        cpf = cpf.replaceAll("[^0-9]", "");
        
        // Verifica se tem 11 dígitos
        if (cpf.length() != 11) {
            return false;
        }
        
        // Verifica se é uma sequência repetida
        if (cpf.matches("(\\d)\\1{10}")) {
            return false;
        }
        
        // Converte para array de inteiros
        int[] digitos = new int[11];
        for (int i = 0; i < 11; i++) {
            digitos[i] = cpf.charAt(i) - 48;
        }
        
        // Calcula primeiro dígito verificador
        int soma1 = 0;
        for (int i = 0; i < 9; i++) {
            soma1 += digitos[i] * (10 - i);
        }
        int resto1 = soma1 % 11;
        int verificador1 = resto1 < 2 ? 0 : 11 - resto1;
        
        // Calcula segundo dígito verificador
        int soma2 = 0;
        for (int i = 0; i < 10; i++) {
            soma2 += digitos[i] * (11 - i);
        }
        int resto2 = soma2 % 11;
        int verificador2 = resto2 < 2 ? 0 : 11 - resto2;
        
        // Compara os dígitos verificadores
        return digitos[9] == verificador1 && digitos[10] == verificador2;
    }
}
