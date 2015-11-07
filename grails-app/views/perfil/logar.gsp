<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>TrainerList</title>

    <g:javascript library="jquery" plugin="jquery" />
    <script type="text/javascript">

        function excluir(id){
            $.ajax({
                type: "POST",
                url: "/TrainerList/perfil/logar",
                data: {id: id},
                success: function (data) {
                    alert("Excluiu")
                },
                dataType: "json"
            });
        }

        function Sucesso(data){
            if(data.ok == true){
                location.href = data.url;
            }else{
                alert(data.msg);
            }
        }

    </script>

    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    label.obrigatorio  {
        font-size: 12px;
        color: #cc0000;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>
<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="page-body" role="main">

    <g:formRemote name="formLogin" url="[controller:'perfil', action:'logar']" onSuccess="Sucesso(data)" >

        <div id="controller-list" role="navigation">
            <div>
                <g:if test="${mensage} != ''" >
                    <label class="obrigatorio"> ${mensage} </label>
                    <br /> <br />
                </g:if>

                <label> e-mail </label>
                <g:textField name="email" value="${emial}" />  <br /> <br />

                <label> Senha </label>
                <g:passwordField name="senha" value=""/> <br />
            </div>
        </div>
        <br />
        <input type="submit" name="logar"  value="Entrar"/>  <br />
    </g:formRemote>
    <br />
    <h5><a href="./personal/create">Cadastrar-se</a></h5>  <br />
    <h6><a href="">Esqueci senha!</a></h6>
</div>
</body>
</html>
