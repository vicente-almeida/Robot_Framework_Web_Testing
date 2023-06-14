*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}    chrome
#Variáveis dos locators de informações pessoais

${URL}                  https://buger-eats.vercel.app/deliver
${NOME}                //input[contains(@name,'name')]
${CPF}                 //input[contains(@name,'cpf')]
${EMAIL}              //input[contains(@type,'email')]
${WHATS}              //input[contains(@name,'whatsapp')]

#Variáveis dos locators de endereço

${CEP}                //input[contains(@name,'postalcode')]
${BUSCAR_CEP}        //input[contains(@type,'button')]
${NUMERO}           //input[contains(@name,'address-number')] 

#Variáveis dos locators de método de entrega

${METODO_ENTREGA}  //img[contains(@alt,'Van/Carro')]

#Variáveis do botão de cadastro

${BTN_CADASTRO}    //button[@type='submit'][contains(.,'Cadastre-se para fazer entregas')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site BugerEats.com.br
    Go To    url=${URL}
Validar o título da página "${TITULO_PAGINA}"
    Title Should Be    title=${TITULO_PAGINA}
    
    
Preencher as informações pessoais
    Click Element    ${NOME}
    Input Text       ${NOME}   Vicente
    Input Text       ${CPF}    00558963025
    Input Text       ${EMAIL}  teste@gmail.com
    Input Text       ${WHATS}  51 998558969
Preencher as informações de endereço
    Input Text       ${CEP}    91920290
    Click Element    ${BUSCAR_CEP}
    Input Text       ${NUMERO}  215

Selecionar o método de entrega
    Click Element   ${METODO_ENTREGA}

Clicar no btoão de cadastro
    Click Element   ${BTN_CADASTRO} 

Validar a mensagem "${MSG_CNH}"   
    Element Should Be Visible    //span[@class='alert-error'][contains(.,'${MSG_CNH}')]

Preencher as informações de endereço sem preencher o input número
    Input Text       ${CEP}    91920290
    Click Element    ${BUSCAR_CEP}


Validar as mensagens "${MSG_CNH}" e "${MSG_ENDERECO}"
    Element Should Be Visible    //span[@class='alert-error'][contains(.,'${MSG_CNH}')]
    Element Should Be Visible    //span[@class='alert-error'][contains(.,'${MSG_ENDERECO}')]

