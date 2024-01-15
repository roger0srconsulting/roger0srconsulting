public with sharing class FormatarNumerosTelefones {

    private static Boolean contemItemDaLista(String texto, List<String> lista) {
        if (texto != null && texto.length() > = 3) {
            String posicaoDDD = texto.substring(1, 3);
            for (String item : lista) {
                if (posicaoDDD.equals(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static List<String> dddsBR = new List<String>{
        '11','12','13','14','15','16','17','18','19','21','22', '24','27','28',
        '31','32','33', '34','35','37','38','41','42','43','44','45','46','47',
        '48','49','51','53','54','55','61','62','63','64','65','66','67','68',
        '69','71','73','74','75','77','79','81','82','83','84','85','86','87',
        '88','89','91','92','93','94','95','96','97','98','99'
    };


    public static String formatarNumerosTelefones(String numero) {
        String numeroLimpo = numero.replaceAll('\\D', '');

        if (numeroLimpo.length() == 12 && numeroLimpo.startsWith('55')) {
            String formatoPadrao = '55 ' + '(' + (numeroLimpo.length() >= 4 ? numeroLimpo.substring(2, 4) : '') + ') ' + (numeroLimpo.length() >= 9 ? numeroLimpo.substring(4, 8) : '') + '-' + (numeroLimpo.length() >= 12 ? numeroLimpo.substring(8, 12) : '');
    
            Boolean contemDddBR = contemItemDaLista(formatoPadrao, dddsBR);

            if (contemDddBR) {
                return formatoPadrao;
            }else{
                return null;
            }
        } else {
            return null;
        }
    }

    public static String formatarNumerosCelular(String numero) {
        String numeroLimpo = numero.replaceAll('\\D', '');
        
        if (numeroLimpo.length() == 13 && numeroLimpo.startsWith('55')) {
            String formatoPadrao = '55 ' + '(' + (numeroLimpo.length() >= 4 ? numeroLimpo.substring(2, 4) : '') + ') ' + (numeroLimpo.length() >= 9 ? numeroLimpo.substring(4, 9) : '') + '-' + (numeroLimpo.length() >= 12 ? numeroLimpo.substring(9, 13) : '');
            
            Boolean contemDDD = contemItemDaLista(formatoPadrao, dddsBR);
            if (contemDDD) {
                return formatoPadrao;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
}
