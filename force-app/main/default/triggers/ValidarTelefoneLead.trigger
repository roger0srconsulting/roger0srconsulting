trigger ValidarTelefoneLead on Lead (before insert, before update) {
    for (Lead lead : Trigger.new) {
        if (!String.isBlank(lead.Phone)) {
            String numeroFormatado = FormatarNumerosTelefones.formatarNumerosTelefones(lead.Phone);

            if (numeroFormatado != null) {
                lead.Phone = numeroFormatado;

            } else {
                lead.addError('Número de telefone inválido. Exemplo: "55 (51) 1234-5678');
            }

        } else if(lead.Phone.length() > 12){
            lead.addError('Verifique a quantidade de digitos do número');
        } else {
            lead.addError('Campo de telefone não pode estar vazio.');
        }
    }

    for (Lead lead : trigger.new) {
        if(!String.isBlank(lead.MobilePhone)){
            String numeroFormatado = FormatarNumerosTelefones.formatarNumerosCelular(lead.MobilePhone);

            if(numeroFormatado != null){
                lead.MobilePhone = numeroFormatado;
            }else {
                lead.addError('Número de telefone inválido. Exemplo: "55 (51) 12345-6789');
            }

        }else if(lead.MobilePhone.length() > 13) {
            lead.addError('Verifique a quantidade de digitos do número.');
        }else {
            lead.addError('Campo de telefone não pode estar vazio.');
        }
    }
}
