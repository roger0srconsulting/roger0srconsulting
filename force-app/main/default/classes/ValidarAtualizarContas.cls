public with sharing class ValidarAtualizarContas {
    private static Boolean validarTelefone(String telefone) {
        String regexPhone = '^\\(\\d{2}\\)\\s\\d{5}-\\d{4}$';
        Pattern regex = Pattern.compile(regex);
        Matcher combinar = regex.matcher(telefone);

    }

    public static void validarContas(List<Account> accs){
        for (Account acc : accs) {
            if (acc.Phone != null && !validarTelefone(acc.Phone)) {
                acc.addError('Formato de telefone inválido.');
            }
        }
    }

    private static String formatarTelefone(String telefone){
        String numeros = telefone.replace('[^0-9]', '');
        String ddd = numeros.substring(0,2);
        String primeiraParte = numeros.substring(2, 7);
        String segundaParte = numeros.substring(7, 11);

        return '(' + ddd + ')' + primeiraParte + '-' + segundaParte;
    }

    public static void atualizarTelefone(List<Account> accs){
        for (Account acc : accs) {
            if(acc.Phone != null){
                acc.Phone = formatarTelefone(acc.Phone);
            }
        }
    }
}