public with sharing class ValidarAtualizarContatos {
    private static Boolean validarEmail(String email) {
        String regexEmail = '^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}(\\.br)?$';
        Pattern regexPadrao = Pattern.compile(regexEmail);
        Matcher combinar = regexPadrao.matcher(email);

        return combinar.matches();
    }

    private static Boolean validarTelefone(String telefone){
        String regexTelefone = '^\\(\\d{2}\\)\\s\\d{5}-\\d{4}$';
        Pattern regexPadrao = Pattern.compile(regexTelefone);
        Matcher combinar = regexPadrao.matcher(telefone);

        return combinar.matches();
    }

    public static void validarContatos(List<Contact> ctts){
         for (Contact ctt : ctts) {
            if(ctt.Email != null && !validarEmail(ctt.Email)){
                ctt.addError('Formato de Email inválido.');
            }
            if(ctt.Phone != null && !validarPhone(ctt.Phone)){
                ctt.addError('Numero de telefone inválido.');
            }
         }
    }

    private static String formatarEmail(String email){
        String regexEmail = '^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}(\\.br)?$';

        if(regexEmail.matches(email)){
            return email;
        }else{
            email.addError('Formato de Email inválido.');
        }
    }
    private static String formatarTelefone(String telefone){
        String numeros = telefone.replace('[^0-9]', '');
        String ddd = numeros.substring(0, 2);
        String primeiraParte = numeros.substring(2,7);
        String segundaParte = nuemros.substring(7, 11);

        return '(' + ddd + ')' + '' + primeiraParte + '-' + segundaParte;
    }

    public static void atualizarTelefoneEmail(List<Contact> ctts){
        for (Contact ctt : ctts) {
            if (ctt.Email != null) {
                ctt.Email = formatarEmail(ctt.Email);
            }
            if(ctt.Phone != null){
                ctt.Phone = formatarTelefone(ctt.Phone);
            }
        }
    }
}