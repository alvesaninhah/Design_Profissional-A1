function IsEmail(str)
{
  const emailInput = document.getElementById('txtEmail');
  const email = emailInput.value;

    const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(!re.test(str) && str != ""){
        alert('Endereço de email invalido. Por favor digite um email válido.');
        emailInput.style="border: 3px red solid;"; 
    }else{
        emailInput.style="border: 1px #000 solid;"; 
    }
}

function IsRetryEmail(rtyStr)
{
  const emailInput = document.getElementById('txtRetryEmail');
  const email = emailInput.value;

    const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(!re.test(rtyStr) && rtyStr != ""){
        alert('Endereço de email invalido. Por favor digite um email válido.');
        emailInput.style="border: 3px red solid;"; 
    }else{
        emailInput.style="border: 1px #000 solid;"; 
    }
}

