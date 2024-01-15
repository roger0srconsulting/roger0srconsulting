trigger ValidarTelefoneContact on Contact (before insert, before update) {
    for (Contact ctt : trigger.new) {
        if(!String.isBlank(ctt.Phone)){
            String formatoPadrao = FormatarNumerosTelefones.formatarNumerosTelefones(ctt.Phone);

            if(formatoPadrao != null){
                ctt.Phone = formatoPadrao;
            }else{
                ctt.Phone.addError('Número de telefone inválido. Exemplo: "55 (51) 1234-5678');
            }
        }else if(ctt.Phone.length() > 12){
            ctt.addError('Verifique a quantidade de digitos do número.');
        }else{
            ctt.addError('Campo de telefone não pode estar vazio.');
        }
    }

    for (Contact ctt : trigger.new) {
        if (!String.isBlank(ctt.MobilePhone)) {
            String formatoPadrao = FormatarNumerosTelefones.formatarNumerosCelular(ctt.MobilePhone);

            if (formatoPadrao != null) {
                ctt.MobilePhone = formatoPadrao;
            } else {
                ctt.addError('Número de telefone inválido. Exemplo: "55 (51) 12345-6789');
            }
        } else if(ctt.MobilePhone.length() > 13) {
            ctt.addError('Verifique a quantidade de digitos do número');
        } else {
            ctt.addError('Campo de telefone não pode estar vazio.');
        }
    }
}