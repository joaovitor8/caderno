import java.util.Scanner;


public class App {
    public static void main(String[] args) {
        // Declaração de variáveis
        double peso, altura, imc;
        String classificacao;
        Scanner entrada = new Scanner(System.in);
        
        try {
            // Solicitação de entrada do usuário
            System.out.println();
            System.out.println("=== Calculadora de IMC ===");
            System.out.print("Digite o peso (em kg): ");
            peso = entrada.nextDouble();
            
            System.out.print("Digite a altura (em metros): ");
            altura = entrada.nextDouble();
            
            // Validação de valores
            if (peso <= 0 || altura <= 0) {
                System.out.println("Erro: Peso e altura devem ser maiores que zero!");
                return;
            }
            
            // Cálculo do IMC
            imc = peso / (altura * altura);
            
            // Classificação do IMC conforme OMS
            if (imc < 18.5) {
                classificacao = "Abaixo do peso";
            } else if (imc >= 18.5 && imc < 25.0) {
                classificacao = "Peso normal";
            } else if (imc >= 25.0 && imc < 30.0) {
                classificacao = "Sobrepeso";
            } else if (imc >= 30.0 && imc < 35.0) {
                classificacao = "Obesidade grau I";
            } else if (imc >= 35.0 && imc < 40.0) {
                classificacao = "Obesidade grau II";
            } else {
                classificacao = "Obesidade grau III (obesidade mórbida)";
            }
            
            // Exibição dos resultados
            System.out.println("\n=== Resultado ===");
            System.out.printf("IMC calculado: %.2f\n", imc);
            System.out.println("Classificação: " + classificacao);
            
        } catch (Exception e) {
            // Tratamento de erros de entrada
            System.out.println("Erro: Por favor, digite valores numéricos válidos!");
            System.out.println("Detalhes: " + e.getMessage());
        } finally {
            // Fechamento do Scanner
            entrada.close();
        }
    }
}
