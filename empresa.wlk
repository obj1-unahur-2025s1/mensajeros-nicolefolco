import mensajerosDePelicula.*

object empresa {
    const mensajeros = []
    const enviados = []
    var pendientes = []

    method facturacion() = enviados.sum({e => e.precio()}) 

    method contratarMensajero(mensajero) {
         mensajeros.add(mensajero)
    }
    
    method despedirMensajero(mensajero) {
        mensajeros.remove(mensajero)
    }

    method despedirMensajeros(){
        mensajeros.clear()
    }

    method esMensajeriaGrande() {
        mensajeros.length() > 2 
    }

   method entregaRapida(){
      
     return paquete.puedeSerEntregado(mensajeros.head())

    }

   method pesoFinal() = mensajeros.last().peso()

   method puedeEntregarCualquiera(unPaquete){
    return mensajeros.any({m => unPaquete.puedeSerEntregado(m)})
   }
   
   method mensajerosQuePuedenEntregar(unPaquete){
     mensajeros.filter({m => unPaquete.puedeSerEntregado(m)})
   }
   
   method mensajeriaEsObesa(){
     self.promedioDelPeso() > 500
   }

   method promedioDelPeso(){
    return mensajeros.sum({m => m.peso()}) / mensajeros.size()
   }

   method entregarPaquete(unPaquete){
    if(self.puedeEntregarCualquiera(unPaquete)){
        enviados.add(unPaquete)
    }
    else {
        pendientes.add(unPaquete)
    }
   }
   
   method enviarTodos(paquetesAEnviar){
     paquetesAEnviar.forEach({p => self.entregarPaquete(p)})
   }
   
   method enviarPaqueteLujoso(){
    self.entregarPaquete(self.paquetePendienteLujoso())
   }
   
  method paquetePendienteLujoso(){
    return pendientes.filter({pendientes.max({p => p.precio()})})
  }

}

