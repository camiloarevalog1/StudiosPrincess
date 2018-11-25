function Carga(url, id, table) {
    //Creamos un objeto dependiendo del navegador
    var objeto;
    if (window.XMLHttpRequest) {
        //Mozilla, Safari, etc
        objeto = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        //Nuestro querido IE
        try {
            objeto = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try { //Version mas antigua
                objeto = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) { }
        }
    }
    if (!objeto) {
        alert("No ha sido posible crear un objeto de XMLHttpRequest");
    }
    //Cuando XMLHttpRequest cambie de estado, ejecutamos esta funcion
    objeto.onreadystatechange = function () {
        cargarobjeto(objeto, id, table)
    }
    objeto.open('GET', url, true) // indicamos con el método open la url a cargar de manera asíncrona
    objeto.send(null) // Enviamos los datos con el metodo send
   
}

function cargarobjeto(objeto, id, table) {
    if (objeto.readyState == 4){
        document.getElementById(id).innerHTML = objeto.responseText
        tab(table);
    } //si se ha cargado completamente
        
}

function cambiar(text){
    document.getElementById('content').innerHTML = text;
}

$(document).ready(function () {
    $('#Jtabla').DataTable({
        
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
})

function tab(id){
    $('#'+id).DataTable({   
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
}