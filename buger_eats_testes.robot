*** Settings ***
Documentation    Essa suíte valida o cadastro do site Buger Eats
Resource         buger_eats_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Realizar o cadastro no site sem anexar CNH
    [Documentation]  Esse teste verifica o cadastro no site da Buger Eats
    ...              que não deve ser possível sem o anexo da CNH
    [Tags]           cadastro_sem_cnh
    Acessar a home page do site BugerEats.com.br
    Validar o título da página "Buger Eats"
    Preencher as informações pessoais
    Preencher as informações de endereço
    Selecionar o método de entrega
    Clicar no btoão de cadastro
    Validar a mensagem "Adicione uma foto da sua CNH"

Caso de Teste 02 - Realizar o cadastro no site sem anexar CNH e sem preencher o input número
    [Documentation]  Esse teste verifica o cadastro no site da Buger Eats
    ...              que não deve ser possível sem o anexo da CNH e sem preencher o input número
    [Tags]           cadastro_sem_cnh_e_numero
    Acessar a home page do site BugerEats.com.br
    Validar o título da página "Buger Eats"
    Preencher as informações pessoais
    Preencher as informações de endereço sem preencher o input número
    Selecionar o método de entrega
    Clicar no btoão de cadastro
    Validar as mensagens "Adicione uma foto da sua CNH" e "É necessário informar o número do endereço"




