import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class App {

    // Constante para o caminho do arquivo de palavras
    // O arquivo deve estar na mesma pasta do programa
    private static final String CAMINHO_ARQUIVO = "palavras.txt";

    public static void main(String[] args) {
        try {
            // Requisito 1.1: Leitura das Palavras
            List<String> palavras = carregarPalavras(CAMINHO_ARQUIVO);

            // Se a lista estiver nula (erro ao carregar ou vazia), encerra o programa
            if (palavras == null) {
                return;
            }

            // Requisito 1.2: Seleção da Palavra Secreta
            String palavraSecreta = selecionarPalavraSecreta(palavras);

            // Inicia o jogo principal
            iniciarJogo(palavraSecreta);

        } catch (IOException e) {
            // Requisito 1.1: Tratamento de erro caso o arquivo não exista
            System.err.println("Erro crítico ao ler o arquivo de palavras: " + e.getMessage());
            System.err.println("Verifique se o arquivo '" + CAMINHO_ARQUIVO + "' existe na mesma pasta do programa.");
        }
    }

    /**
     * Requisito 1.1: Carrega a lista de palavras do arquivo.
     * @param caminho O caminho para o arquivo palavras.txt
     * @return Uma lista de palavras ou null se o arquivo não for encontrado ou estiver vazio.
     * @throws IOException Se ocorrer um erro de leitura do arquivo.
     */
    private static List<String> carregarPalavras(String caminho) throws IOException {
        List<String> palavras = Files.readAllLines(Paths.get(caminho));

        if (palavras.isEmpty()) {
            System.err.println("O arquivo de palavras está vazio. O jogo não pode iniciar.");
            return null; // Retorna nulo para indicar falha
        }
        return palavras;
    }

    /**
     * Requisito 1.2: Seleciona aleatoriamente uma palavra da lista e a converte para minúsculas.
     * @param palavras A lista de palavras carregada.
     * @return A palavra secreta escolhida.
     */
    private static String selecionarPalavraSecreta(List<String> palavras) {
        Random random = new Random();
        int indiceAleatorio = random.nextInt(palavras.size());
        return palavras.get(indiceAleatorio).toLowerCase();
    }

    /**
     * Requisito 1.3: Contém a mecânica principal e o loop do jogo.
     * @param palavraSecreta A palavra que o jogador deve adivinhar.
     */
    private static void iniciarJogo(String palavraSecreta) {
        Scanner scanner = new Scanner(System.in);
        
        int vidas = 6; // O jogador começa com 6 vidas
        List<Character> letrasTentadas = new ArrayList<>();
        
        // Requisito 1.7: Inicializa a palavra oculta com underscores
        // Ex: "java" -> "_ _ _ _ "
        StringBuilder palavraAdivinhada = new StringBuilder();
        for (int i = 0; i < palavraSecreta.length(); i++) {
            palavraAdivinhada.append("_ ");
        }

        boolean jogoAcabou = false;

        // Loop principal do jogo
        while (!jogoAcabou) {
            // Requisitos 1.3 e 1.6: Limpar a console
            limparConsole();

            System.out.println("--- JOGO DA FORCA ---");
            System.out.println();

            // Requisito 1.5 e 1.7: Exibir a forca
            desenharForca(vidas);
            System.out.println();

            // Requisito 1.7: Exibir informações visuais
            System.out.println("Vidas restantes: " + vidas);
            System.out.println("Palavra: " + palavraAdivinhada.toString());
            System.out.println("Letras já tentadas: " + letrasTentadas.toString());
            System.out.println();

            // Requisito 1.3 e 2.3: Leitura e validação da letra
            char letra = lerTentativa(scanner, letrasTentadas);
            letrasTentadas.add(letra); // Adiciona a letra válida às tentadas

            // Verifica se a letra está na palavra
            boolean acertouLetra = atualizarPalavraAdivinhada(palavraSecreta, palavraAdivinhada, letra);

            if (acertouLetra) {
                // Requisito 1.4: Verifica condição de vitória
                // Se não houver mais underscores, o jogador venceu
                if (palavraAdivinhada.indexOf("_") == -1) {
                    jogoAcabou = true;
                    exibirTelaFinal(true, palavraSecreta, vidas);
                }
            } else {
                // Requisito 1.3: Se a letra não estiver na palavra, perde uma vida
                vidas--;
                
                // Requisito 1.4: Verifica condição de derrota
                if (vidas == 0) {
                    jogoAcabou = true;
                    exibirTelaFinal(false, palavraSecreta, vidas);
                }
            }
        }
        
        scanner.close();
    }

    /**
     * Requisito 1.3 e 2.3: Lê a entrada do jogador, valida (letra única, não repetida).
     * @param scanner O objeto Scanner para leitura.
     * @param letrasTentadas A lista de letras já tentadas.
     * @return A letra digitada, validada e em minúsculo.
     */
    private static char lerTentativa(Scanner scanner, List<Character> letrasTentadas) {
        while (true) {
            System.out.print("Digite uma letra: ");
            String input = scanner.nextLine().toLowerCase().trim();

            // Validação 1: Deve ter apenas um caractere
            if (input.length() != 1) {
                System.out.println("Erro: Por favor, digite apenas UMA letra.");
                continue; // Pede novamente
            }

            char letra = input.charAt(0);

            // Validação 2: Deve ser uma letra
            if (!Character.isLetter(letra)) {
                System.out.println("Erro: Por favor, digite apenas LETRAS.");
                continue;
            }

            // Validação 3: Não pode ser repetida
            if (letrasTentadas.contains(letra)) {
                System.out.println("Erro: Você já tentou a letra '" + letra + "'. Tente outra.");
                continue;
            }

            // Se passou em todas as validações, retorna a letra
            return letra;
        }
    }

    /**
     * Atualiza o StringBuilder da palavra adivinhada com a letra correta.
     * @param palavraSecreta A palavra completa.
     * @param palavraAdivinhada O StringBuilder com os underscores.
     * @param letra A letra tentada.
     * @return true se a letra foi encontrada, false caso contrário.
     */
    private static boolean atualizarPalavraAdivinhada(String palavraSecreta, StringBuilder palavraAdivinhada, char letra) {
        boolean acertou = false;
        for (int i = 0; i < palavraSecreta.length(); i++) {
            if (palavraSecreta.charAt(i) == letra) {
                // Atualiza a posição no StringBuilder (i * 2 para contar os espaços)
                palavraAdivinhada.setCharAt(i * 2, letra);
                acertou = true;
            }
        }
        return acertou;
    }

    /**
     * Requisito 1.4: Exibe a tela final de vitória ou derrota.
     * @param venceu true se o jogador venceu, false se perdeu.
     * @param palavraSecreta A palavra secreta.
     * @param vidasFinais O número de vidas no final (0 se perdeu).
     */
    private static void exibirTelaFinal(boolean venceu, String palavraSecreta, int vidasFinais) {
        limparConsole();
        System.out.println("--- FIM DE JOGO ---");
        System.out.println();
        
        // Requisito 1.4: Exibe o estado final da forca
        desenharForca(vidasFinais);
        System.out.println();

        if (venceu) {
            System.out.println("PARABÉNS! Você venceu!");
        } else {
            System.out.println("VOCÊ PERDEU! Mais sorte na próxima vez.");
        }
        
        System.out.println("A palavra secreta era: " + palavraSecreta);
    }


    /**
     * Requisito 1.5: Desenha a forca (ASCII Art) com base no número de vidas.
     * @param vidas Vidas restantes (de 6 a 0).
     */
    private static void desenharForca(int vidas) {
        // Os backslashes (contra-barras) precisam ser "escapados" com outro backslash
        String[] forca = {
            // 0 vidas (Perdeu)
            " +---+\n" +
            " |   |\n" +
            " O   |\n" +
            " /|\\  |\n" + // \\ é usado para exibir um \
            " / \\  |\n" + // / \
            "     |\n" +
            "=========",
            
            // 1 vida
            " +---+\n" +
            " |   |\n" +
            " O   |\n" +
            " /|\\  |\n" +
            " /     |\n" +
            "     |\n" +
            "=========",
            
            // 2 vidas
            " +---+\n" +
            " |   |\n" +
            " O   |\n" +
            " /|\\  |\n" +
            "     |\n" +
            "     |\n" +
            "=========",

            // 3 vidas
            " +---+\n" +
            " |   |\n" +
            " O   |\n" +
            " /|    |\n" +
            "     |\n" +
            "     |\n" +
            "=========",

            // 4 vidas
            " +---+\n" +
            " |   |\n" +
            " O   |\n" +
            " |     |\n" +
            "     |\n" +
            "     |\n" +
            "=========",

            // 5 vidas
            " +---+\n" +
            " |   |\n" +
            " O   |\n" +
            "     |\n" +
            "     |\n" +
            "     |\n" +
            "=========",

            // 6 vidas (Início)
            " +---+\n" +
            " |   |\n" +
            "     |\n" +
            "     |\n" +
            "     |\n" +
            "     |\n" +
            "========="
        };

        // Imprime o desenho correspondente (6 vidas = índice 6, 0 vidas = índice 0)
        System.out.println(forca[vidas]);
    }

    /**
     * Requisito 1.3 e 1.6: "Limpa" a console imprimindo 50 linhas em branco.
     * Esta é uma solução portátil que funciona em qualquer terminal.
     */
    private static void limparConsole() {
        for (int i = 0; i < 50; i++) {
            System.out.println();
        }
    }
}