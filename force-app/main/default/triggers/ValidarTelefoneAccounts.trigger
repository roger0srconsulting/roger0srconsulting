trigger ValidarTelefoneAccounts on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        if (!String.isBlank(acc.Phone)) {
            String numeroFormatado = FormatarNumerosTelefones.formatarNumerosTelefones(acc.Phone);

            if (numeroFormatado != null) {
                acc.Phone = numeroFormatado;

                // if(numeroFormatado.length() > 17){
                //     acc.addError('Verifique a quantidade de digitos do número"');
                // }
            } else {
                acc.addError('Número de telefone inválido. Exemplo: "55 (51) 1234-5678"');
            }
        } else if(acc.Phone.length() > 12){
            acc.addError('Verifique a quantidade de digitos do número"');
        } else {
            acc.addError('Campo de telefone não pode estar vazio.');
        }

    }
}
